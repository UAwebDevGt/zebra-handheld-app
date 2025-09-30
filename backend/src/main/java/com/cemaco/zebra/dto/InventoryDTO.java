/*
 * package com.cemaco.zebra.dto;

import com.cemaco.zebra.model.TblDetListaPrecios;

import java.math.BigDecimal;
import java.util.List;

public class InventoryDTO {
    private String sku;
    private String nombre;
    private BigDecimal existencia;
    private String codWarehouse;
    private BigDecimal minimo;
    private BigDecimal maximo;
    private List<TblDetListaPrecios> precios;

    // getters/setters
    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public BigDecimal getExistencia() { return existencia; }
    public void setExistencia(BigDecimal existencia) { this.existencia = existencia; }
    public String getCodWarehouse() { return codWarehouse; }
    public void setCodWarehouse(String codWarehouse) { this.codWarehouse = codWarehouse; }
    public BigDecimal getMinimo() { return minimo; }
    public void setMinimo(BigDecimal minimo) { this.minimo = minimo; }
    public BigDecimal getMaximo() { return maximo; }
    public void setMaximo(BigDecimal maximo) { this.maximo = maximo; }
    public List<TblDetListaPrecios> getPrecios() { return precios; }
    public void setPrecios(List<TblDetListaPrecios> precios) { this.precios = precios; }
}*/


package com.cemaco.zebra.dto;

import lombok.Data;
import java.math.BigDecimal;
import java.util.List;
import com.cemaco.zebra.model.TblDetListaPrecios;

@Data
public class InventoryDTO {
    private String sku;
    private String nombre;
    private BigDecimal existencia;
    private String codWarehouse;
    private BigDecimal minimo;
    private BigDecimal maximo;
    private List<TblDetListaPrecios> precios;
}


