package com.cemaco.zebra.dto;

import java.math.BigDecimal;
import java.util.Date;

public class ProductDTO {
    private String sku;
    private String barras;
    private String nombre;
    private BigDecimal precio;
    private BigDecimal existencia;
    private BigDecimal precioOferta;
    private Date ofertaHasta;
    private BigDecimal minimo;
    private BigDecimal maximo;
    private BigDecimal precioMinimo;

    // Getters / setters
    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }
    public String getBarras() { return barras; }
    public void setBarras(String barras) { this.barras = barras; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public BigDecimal getPrecio() { return precio; }
    public void setPrecio(BigDecimal precio) { this.precio = precio; }
    public BigDecimal getExistencia() { return existencia; }
    public void setExistencia(BigDecimal existencia) { this.existencia = existencia; }
    public BigDecimal getPrecioOferta() { return precioOferta; }
    public void setPrecioOferta(BigDecimal precioOferta) { this.precioOferta = precioOferta; }
    public Date getOfertaHasta() { return ofertaHasta; }
    public void setOfertaHasta(Date ofertaHasta) { this.ofertaHasta = ofertaHasta; }
    public BigDecimal getMinimo() { return minimo; }
    public void setMinimo(BigDecimal minimo) { this.minimo = minimo; }
    public BigDecimal getMaximo() { return maximo; }
    public void setMaximo(BigDecimal maximo) { this.maximo = maximo; }
    public BigDecimal getPrecioMinimo() { return precioMinimo; }
    public void setPrecioMinimo(BigDecimal precioMinimo) { this.precioMinimo = precioMinimo; }
}

