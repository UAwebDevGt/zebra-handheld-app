package com.cemaco.zebra.repository;

import com.cemaco.zebra.model.TblArticulo;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ArticuloRepository extends JpaRepository<TblArticulo, String> {
}

