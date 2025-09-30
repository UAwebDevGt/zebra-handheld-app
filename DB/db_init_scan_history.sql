-- db_init_scan_history.sql
CREATE TABLE IF NOT EXISTS scan_history (
  id BIGINT AUTO_INCREMENT PRIMARY KEY,
  barcode VARCHAR(200) NOT NULL,
  sku VARCHAR(100),
  result_json TEXT,
  scanned_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- optional index to speed queries
CREATE INDEX IF NOT EXISTS idx_scan_history_barcode ON scan_history(barcode);
CREATE INDEX IF NOT EXISTS idx_scan_history_scanned_at ON scan_history(scanned_at);

