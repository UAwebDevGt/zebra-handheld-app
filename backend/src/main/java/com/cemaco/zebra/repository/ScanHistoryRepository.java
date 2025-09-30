package com.cemaco.zebra.repository;

import com.cemaco.zebra.entity.ScanHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ScanHistoryRepository extends JpaRepository<ScanHistory, Long> {
    // additional query methods can be added later
}

