/*
 * package com.cemaco.zebra.service;

import com.cemaco.zebra.dto.InventoryDTO;
import com.cemaco.zebra.model.*;
import com.cemaco.zebra.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.math.BigDecimal;

@Service
public class InventoryService {

    @Autowired private ExistenciaRepository existenciaRepo;
    @Autowired private ArticuloRepository articuloRepo;
    @Autowired private ListaPreciosRepository preciosRepo;
    @Autowired private ProductoRotacionRepository rotacionRepo;

    // list for a given warehouse (or all if warehouse == null)
    public List<InventoryDTO> getInventoryForWarehouse(String codWarehouse) {
        List<TblExistencia> existencias;
        if(codWarehouse == null) {
            existencias = existenciaRepo.findAll();
        } else {
            existencias = existenciaRepo.findByCodWarehouse(codWarehouse);
        }

        List<InventoryDTO> out = new ArrayList<>();
        for(TblExistencia e : existencias) {
            TblArticulo a = articuloRepo.findById(e.getSku()).orElse(null);
            if(a == null) continue;
            InventoryDTO dto = new InventoryDTO();
            dto.setSku(a.getSku());
            dto.setNombre(a.getNombre());
            dto.setExistencia(e.getExistencia());
            dto.setCodWarehouse(e.getCodWarehouse());

            // get min/max from rotation by matching tienda = codWarehouse mapping - best effort:
            Optional<TblProductoRotacion> rot = rotacionRepo.findFirstBySkuAndCodTienda(a.getSku(), codWarehouse);
            rot.ifPresent(r -> {
                // dto.setMinimo(r.getMinimo());
                // dto.setMaximo(r.getMaximo());
		dto.setMinimo(r.getMinimo() != null ? BigDecimal.valueOf(r.getMinimo()) : null);
    		dto.setMaximo(r.getMaximo() != null ? BigDecimal.valueOf(r.getMaximo()) : null);
            });

            // prices
            List<TblDetListaPrecios> prices = preciosRepo.findBySku(a.getSku());
            dto.setPrecios(prices);

            out.add(dto);
        }
        return out;
    }

    // product details for a specific sku and warehouse (null warehouse => admin view)
    public Optional<InventoryDTO> getProductDetails(String sku, String codWarehouse) {
        TblArticulo a = articuloRepo.findById(sku).orElse(null);
        if(a == null) return Optional.empty();

        TblExistencia e = null;
        if(codWarehouse == null) {
            // find any existence row (admin)
            List<TblExistencia> list = existenciaRepo.findBySku(sku);
            if(!list.isEmpty()) e = list.get(0);
        } else {
            e = existenciaRepo.findFirstBySkuAndCodWarehouse(sku, codWarehouse).orElse(null);
        }
        if(e == null) return Optional.empty();

        InventoryDTO dto = new InventoryDTO();
        dto.setSku(a.getSku());
        dto.setNombre(a.getNombre());
        dto.setExistencia(e.getExistencia());
        dto.setCodWarehouse(e.getCodWarehouse());

        Optional<TblProductoRotacion> rot = rotacionRepo.findFirstBySkuAndCodTienda(sku, e.getCodWarehouse());
        rot.ifPresent(r -> {
            // dto.setMinimo(r.getMinimo());
            // dto.setMaximo(r.getMaximo());
	    dto.setMinimo(r.getMinimo() != null ? BigDecimal.valueOf(r.getMinimo()) : null);
	    dto.setMaximo(r.getMaximo() != null ? BigDecimal.valueOf(r.getMaximo()) : null);
        });

        dto.setPrecios(preciosRepo.findBySku(sku));
        return Optional.of(dto);
    }
}
*/


package com.cemaco.zebra.service;

import com.cemaco.zebra.dto.InventoryDTO;
import com.cemaco.zebra.model.*;
import com.cemaco.zebra.repository.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;
import java.math.BigDecimal;

@Service
public class InventoryService {

    @Autowired private ExistenciaRepository existenciaRepo;
    @Autowired private ArticuloRepository articuloRepo;
    @Autowired private ListaPreciosRepository preciosRepo;
    @Autowired private ProductoRotacionRepository rotacionRepo;

    // list for a given warehouse (or all if warehouse == null)
    public List<InventoryDTO> getInventoryForWarehouse(String codWarehouse) {
        List<TblExistencia> existencias;
        if(codWarehouse == null) {
            existencias = existenciaRepo.findAll();
        } else {
            existencias = existenciaRepo.findByCodWarehouse(codWarehouse);
        }

        List<InventoryDTO> out = new ArrayList<>();
        for(TblExistencia e : existencias) {
            TblArticulo a = articuloRepo.findById(e.getSku()).orElse(null);
            if(a == null) continue;

            InventoryDTO dto = new InventoryDTO();
            dto.setSku(a.getSku());
            dto.setNombre(a.getNombre());
            dto.setExistencia(e.getExistencia());
            dto.setCodWarehouse(e.getCodWarehouse());

            // get min/max from rotation (convert Double -> BigDecimal)
            Optional<TblProductoRotacion> rot = rotacionRepo.findFirstBySkuAndCodTienda(a.getSku(), codWarehouse);
            rot.ifPresent(r -> {
                dto.setMinimo(r.getMinimo());
                dto.setMaximo(r.getMaximo());
            });

            // prices
            List<TblDetListaPrecios> prices = preciosRepo.findBySku(a.getSku());
            dto.setPrecios(prices);

            out.add(dto);
        }
        return out;
    }

    // product details for a specific sku and warehouse (null warehouse => admin view)
    public Optional<InventoryDTO> getProductDetails(String sku, String codWarehouse) {
        TblArticulo a = articuloRepo.findById(sku).orElse(null);
        if(a == null) return Optional.empty();

        TblExistencia e = null;
        if(codWarehouse == null) {
            // find any existence row (admin)
            List<TblExistencia> list = existenciaRepo.findBySku(sku);
            if(!list.isEmpty()) e = list.get(0);
        } else {
            e = existenciaRepo.findFirstBySkuAndCodWarehouse(sku, codWarehouse).orElse(null);
        }
        if(e == null) return Optional.empty();

        InventoryDTO dto = new InventoryDTO();
        dto.setSku(a.getSku());
        dto.setNombre(a.getNombre());
        dto.setExistencia(e.getExistencia());
        dto.setCodWarehouse(e.getCodWarehouse());

        // min/max conversion again
        Optional<TblProductoRotacion> rot = rotacionRepo.findFirstBySkuAndCodTienda(sku, e.getCodWarehouse());
        rot.ifPresent(r -> {
            dto.setMinimo(r.getMinimo());
            dto.setMaximo(r.getMaximo());
        });

        dto.setPrecios(preciosRepo.findBySku(sku));
        return Optional.of(dto);
    }
}

