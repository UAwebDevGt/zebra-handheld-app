package com.cemaco.zebra.dto;

import java.time.LocalDateTime;

public class ScanHistoryDTO {
    private Long id;
    private String barcode;
    private String sku;
    private LocalDateTime scannedAt;

    public ScanHistoryDTO() {}

    public ScanHistoryDTO(Long id, String barcode, String sku, LocalDateTime scannedAt) {
        this.id = id;
        this.barcode = barcode;
        this.sku = sku;
        this.scannedAt = scannedAt;
    }

    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    public String getBarcode() { return barcode; }
    public void setBarcode(String barcode) { this.barcode = barcode; }
    public String getSku() { return sku; }
    public void setSku(String sku) { this.sku = sku; }
    public LocalDateTime getScannedAt() { return scannedAt; }
    public void setScannedAt(LocalDateTime scannedAt) { this.scannedAt = scannedAt; }
}

