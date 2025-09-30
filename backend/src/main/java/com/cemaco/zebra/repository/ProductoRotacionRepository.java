package com.cemaco.zebra.repository;

import com.cemaco.zebra.model.TblProductoRotacion;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.Optional;

public interface ProductoRotacionRepository extends JpaRepository<TblProductoRotacion, Long> {
    Optional<TblProductoRotacion> findFirstBySkuAndCodTienda(String sku, String codTienda);
}

