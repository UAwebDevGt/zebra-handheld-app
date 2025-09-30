package com.cemaco.zebra.controller;

import org.springframework.web.bind.annotation.*;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/scan")
public class ScanController {

    @PostMapping("/submit")
    public Map<String, String> submitScan(@RequestBody Map<String, String> scanData) {
        Map<String, String> response = new HashMap<>();
        response.put("status", "success");
        response.put("scannedCode", scanData.get("code"));
        return response;
    }

    @GetMapping("/test")
    public Map<String, String> testEndpoint() {
        Map<String, String> response = new HashMap<>();
        response.put("message", "Backend is working!");
        return response;
    }
}

