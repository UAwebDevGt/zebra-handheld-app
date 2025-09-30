package com.cemaco.zebra.security;

import io.jsonwebtoken.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import java.util.Date;

@Component
public class JwtUtil {

    @Value("${jwt.secret}")
    private String SECRET;

    @Value("${jwt.expiration-ms}")
    private long EXP_MS;

    public String generateToken(String username, String role, String codWarehouse) {
        return Jwts.builder()
                .setSubject(username)
                .claim("role", role)
                .claim("codWarehouse", codWarehouse)
                .setIssuedAt(new Date())
                .setExpiration(new Date(System.currentTimeMillis() + EXP_MS))
                .signWith(SignatureAlgorithm.HS512, SECRET)
                .compact();
    }

    public Claims extractAllClaims(String token) {
        return Jwts.parser().setSigningKey(SECRET).parseClaimsJws(token).getBody();
    }

    public String extractUsername(String token) {
        return extractAllClaims(token).getSubject();
    }
}

