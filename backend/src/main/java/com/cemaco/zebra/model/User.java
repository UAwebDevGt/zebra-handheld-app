package com.cemaco.zebra.model;

import jakarta.persistence.*;

@Entity
@Table(name = "Tbl_Users")
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique=true)
    private String username;

    private String password;

    private String role; // ROLE_ADMIN or ROLE_EMPLOYEE

    @Column(name = "cod_warehouse")
    private String codWarehouse; // assigned warehouse for employee

    // getters & setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getUsername() { return username; }
    public void setUsername(String username) { this.username = username; }
    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }
    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }
    public String getCodWarehouse() { return codWarehouse; }
    public void setCodWarehouse(String codWarehouse) { this.codWarehouse = codWarehouse; }
}

