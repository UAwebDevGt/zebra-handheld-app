/*
 * package com.cemaco.zebra.model;

import jakarta.persistence.*;
import java.math.BigDecimal;

import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Tbl_ProductoRotacion")
@Getter
@Setter

public class TblProductoRotacion {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name="SKU")
    private String sku;

    @Column(name="Cod_Tienda")
    private String codTienda;

    @Column(name="Minimo")
    private BigDecimal minimo;

    @Column(name="Maximo")
    private BigDecimal maximo;

    // getters/setters
} */

package com.cemaco.zebra.model;

import lombok.*;
import jakarta.persistence.*;
import java.math.BigDecimal;

@Entity
@Table(name = "tbl_producto_rotacion")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TblProductoRotacion {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "sku", nullable = false)
    private String sku;

    @Column(name = "cod_tienda", nullable = false)
    private String codTienda;

    @Column(name = "minimo")
    private BigDecimal minimo;

    @Column(name = "maximo")
    private BigDecimal maximo;
}

