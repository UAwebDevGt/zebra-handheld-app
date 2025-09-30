package com.cemaco.zebra.controller;

import com.cemaco.zebra.dto.InventoryDTO;
import com.cemaco.zebra.service.InventoryService;
import com.cemaco.zebra.security.JwtUtil;
import io.jsonwebtoken.Claims;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.http.ResponseEntity;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api")
public class InventoryController {

    @Autowired private InventoryService inventoryService;
    @Autowired private JwtUtil jwtUtil;

    // list inventory (admin -> all, employee -> own warehouse)
    @GetMapping("/inventory")
    public List<InventoryDTO> listInventory(@RequestHeader("Authorization") String authHeader) {
        String token = authHeader.replace("Bearer ", "");
        Claims claims = jwtUtil.extractAllClaims(token);
        String role = claims.get("role", String.class);
        String codWarehouse = claims.get("codWarehouse", String.class);

        if("ROLE_ADMIN".equals(role)) codWarehouse = null; // admin sees all
        return inventoryService.getInventoryForWarehouse(codWarehouse);
    }

    // product details
    @GetMapping("/inventory/{sku}")
    public ResponseEntity<?> productDetails(@RequestHeader("Authorization") String authHeader,
                                            @PathVariable String sku) {
        String token = authHeader.replace("Bearer ", "");
        Claims claims = jwtUtil.extractAllClaims(token);
        String role = claims.get("role", String.class);
        String codWarehouse = claims.get("codWarehouse", String.class);
        if("ROLE_ADMIN".equals(role)) codWarehouse = null;

        Optional<InventoryDTO> dtoOpt = inventoryService.getProductDetails(sku, codWarehouse);

        // Corregido: evitar error de inferencia de lambda
        if(dtoOpt.isPresent()) {
            return ResponseEntity.ok(dtoOpt.get());
        } else {
            return ResponseEntity.status(404).body("Not found");
        }
    }

    @GetMapping("/health")
    public String health() { return "OK"; }
}

