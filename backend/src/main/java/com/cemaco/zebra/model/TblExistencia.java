/*
 * package com.cemaco.zebra.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Entity
@Table(name = "Tbl_Existencia")
@Getter
@Setter
public class TblExistencia {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "SKU")
    private String sku;

    @Column(name = "Cod_Warehouse")
    private String codWarehouse;

    @Column(name = "Existencia")
    private Double existencia;
} */

package com.cemaco.zebra.model;

import lombok.Data;
import jakarta.persistence.*;
import java.math.BigDecimal;

@Data
@Entity
@Table(name = "tbl_existencia")
public class TblExistencia {

    @Id
    private String sku;

    @Column(name = "cod_warehouse")
    private String codWarehouse;

    @Column(name = "existencia")
    private BigDecimal existencia; // convertiremos a BigDecimal en DTO
}

