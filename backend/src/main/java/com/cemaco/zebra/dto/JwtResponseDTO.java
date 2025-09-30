package com.cemaco.zebra.dto;

public class JwtResponseDTO {
    private String token;
    private String role;
    private String codWarehouse;
    public JwtResponseDTO() {}
    public JwtResponseDTO(String t, String r, String c) { token = t; role = r; codWarehouse = c; }
    public String getToken() { return token; }
    public String getRole() { return role; }
    public String getCodWarehouse() { return codWarehouse; }
}

