package com.cemaco.zebra.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name="TblDet_ListaPrecios")
public class TblDetListaPrecios {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="SKU")
    private String sku;

    @Column(name="Cod_Lista")
    private Integer codLista;

    @Column(name="Precio")
    private BigDecimal precio;

    // getters/setters
}

