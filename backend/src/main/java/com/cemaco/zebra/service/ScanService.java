package com.cemaco.zebra.service;

import com.cemaco.zebra.dto.ProductDTO;
import com.cemaco.zebra.dto.ScanHistoryDTO;
import com.cemaco.zebra.entity.ScanHistory;
import com.cemaco.zebra.repository.ScanHistoryRepository;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.stream.Collectors;

@Service
public class ScanService {

    private final NamedParameterJdbcTemplate jdbc;
    private final ScanHistoryRepository historyRepository;

    public ScanService(NamedParameterJdbcTemplate jdbc, ScanHistoryRepository historyRepository) {
        this.jdbc = jdbc;
        this.historyRepository = historyRepository;
    }

    /**
     * Looks up product data by barcode.
     * Uses view vw_product_list if present (created by migration). If not found, returns empty Optional.
     */
    public Optional<ProductDTO> lookupByBarcode(String barcode) {
        String sql = "SELECT SKU, Barras, Nombre, Precio, Existencia, PrecioOferta, OfertaHasta, Minimo, Maximo, PrecioMinimo " +
                     "FROM vw_product_list WHERE Barras = :barcode LIMIT 1";

        MapSqlParameterSource params = new MapSqlParameterSource("barcode", barcode);
        try {
            List<ProductDTO> rows = jdbc.query(sql, params, (rs, rowNum) -> mapRsToProduct(rs));
            if (rows.isEmpty()) return Optional.empty();
            return Optional.of(rows.get(0));
        } catch (Exception ex) {
            // If vw_product_list does not exist or query fails, attempt fallback: try Tbl_Barras -> SKU -> basic product info
            return fallbackLookup(barcode);
        }
    }

    private Optional<ProductDTO> fallbackLookup(String barcode) {
        try {
            String skuSql = "SELECT SKU FROM Tbl_Barras WHERE Barras = :barcode LIMIT 1";
            var sku = jdbc.queryForObject(skuSql, Map.of("barcode", barcode), String.class);
            if (sku == null) return Optional.empty();

            String q = "SELECT a.SKU, a.Nombre AS Nombre, IFNULL(lp.Precio,0) AS Precio, IFNULL(e.Existencia,0) AS Existencia " +
                       "FROM Tbl_Articulo a " +
                       "LEFT JOIN TblDet_ListaPrecios lp ON lp.SKU = a.SKU AND lp.Cod_Lista = 12 " +
                       "LEFT JOIN (SELECT SKU, SUM(Existencia) AS Existencia FROM Tbl_Existencia GROUP BY SKU) e ON e.SKU = a.SKU " +
                       "WHERE a.SKU = :sku LIMIT 1";

            MapSqlParameterSource params = new MapSqlParameterSource("sku", sku);
            List<ProductDTO> rows = jdbc.query(q, params, (rs, rowNum) -> {
                ProductDTO p = new ProductDTO();
                p.setSku(rs.getString("SKU"));
                p.setNombre(rs.getString("Nombre"));
                p.setPrecio(rs.getBigDecimal("Precio"));
                p.setExistencia(rs.getBigDecimal("Existencia"));
                return p;
            });
            if (rows.isEmpty()) return Optional.empty();
            return Optional.of(rows.get(0));
        } catch (Exception e) {
            return Optional.empty();
        }
    }

    private ProductDTO mapRsToProduct(ResultSet rs) throws SQLException {
        ProductDTO p = new ProductDTO();
        p.setSku(rs.getString("SKU"));
        p.setBarras(rs.getString("Barras"));
        p.setNombre(rs.getString("Nombre"));
        p.setPrecio(rs.getBigDecimal("Precio"));
        p.setExistencia(rs.getBigDecimal("Existencia"));
        p.setPrecioOferta(rs.getBigDecimal("PrecioOferta"));
        java.sql.Timestamp t = rs.getTimestamp("OfertaHasta");
        if (t != null) p.setOfertaHasta(new java.util.Date(t.getTime()));
        p.setMinimo(rs.getBigDecimal("Minimo"));
        p.setMaximo(rs.getBigDecimal("Maximo"));
        p.setPrecioMinimo(rs.getBigDecimal("PrecioMinimo"));
        return p;
    }

    /**
     * Records a scan into scan_history table and returns ScanHistoryDTO
     */
    public ScanHistoryDTO recordScan(String barcode, ProductDTO product) {
        String sku = (product != null) ? product.getSku() : null;
        String resultJson = "{}";
        try {
            if (product != null) {
                // very small JSON representation
                resultJson = String.format("{\"sku\":\"%s\",\"nombre\":\"%s\",\"existencia\":%s}",
                        product.getSku(), product.getNombre(), product.getExistencia() == null ? "0" : product.getExistencia().toPlainString());
            }
        } catch (Exception ex) {
            resultJson = "{}";
        }

        ScanHistory history = new ScanHistory(barcode, sku, resultJson);
        history = historyRepository.save(history);
        return new ScanHistoryDTO(history.getId(), history.getBarcode(), history.getSku(), history.getScannedAt());
    }

    public List<ScanHistoryDTO> getRecentHistory(int limit) {
        List<ScanHistory> list = historyRepository.findAll()
                .stream()
                .sorted((a,b) -> b.getScannedAt().compareTo(a.getScannedAt()))
                .limit(limit)
                .collect(Collectors.toList());

        return list.stream()
                .map(h -> new ScanHistoryDTO(h.getId(), h.getBarcode(), h.getSku(), h.getScannedAt()))
                .collect(Collectors.toList());
    }

    public List<ScanHistoryDTO> getAllHistory() {
        return getRecentHistory(1000);
    }
}

