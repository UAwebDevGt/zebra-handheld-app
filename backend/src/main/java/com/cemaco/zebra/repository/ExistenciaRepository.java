package com.cemaco.zebra.repository;

import com.cemaco.zebra.model.TblExistencia;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;
import java.util.Optional;

public interface ExistenciaRepository extends JpaRepository<TblExistencia, Long> {
    List<TblExistencia> findByCodWarehouse(String codWarehouse);
    Optional<TblExistencia> findFirstBySkuAndCodWarehouse(String sku, String codWarehouse);
    List<TblExistencia> findBySku(String sku);
}

