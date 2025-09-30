package com.cemaco.zebra.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name="Tbl_Articulo")
public class TblArticulo {
    @Id
    @Column(name="SKU")
    private String sku;

    @Column(name="Nombre")
    private String nombre;

    @Column(name="TipoArt")
    private String tipoArt;

    @Column(name="SKUSustituto")
    private String skuSustituto;

    @Column(name="ValidoCompra")
    private String validoCompra;

    @Column(name="TrasladadoSAP")
    private Date trasladadoSAP;

    // getters/setters
    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }
    public String getNombre() { return nombre; }
    public void setNombre(String nombre) { this.nombre = nombre; }
    public String getTipoArt() { return tipoArt; }
    public void setTipoArt(String tipoArt) { this.tipoArt = tipoArt; }
    public String getSkuSustituto() { return skuSustituto; }
    public void setSkuSustituto(String skuSustituto) { this.skuSustituto = skuSustituto; }
    public String getValidoCompra() { return validoCompra; }
    public void setValidoCompra(String validoCompra) { this.validoCompra = validoCompra; }
    public Date getTrasladadoSAP() { return trasladadoSAP; }
    public void setTrasladadoSAP(Date trasladadoSAP) { this.trasladadoSAP = trasladadoSAP; }
}

