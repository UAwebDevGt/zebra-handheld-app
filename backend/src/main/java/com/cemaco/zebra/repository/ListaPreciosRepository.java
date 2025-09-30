package com.cemaco.zebra.repository;

import com.cemaco.zebra.model.TblDetListaPrecios;
import org.springframework.data.jpa.repository.JpaRepository;
import java.util.List;

public interface ListaPreciosRepository extends JpaRepository<TblDetListaPrecios, Long> {
    List<TblDetListaPrecios> findBySkuAndCodLista(String sku, Integer codLista);
    List<TblDetListaPrecios> findBySku(String sku);
}

