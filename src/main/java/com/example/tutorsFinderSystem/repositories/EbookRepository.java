package com.example.tutorsFinderSystem.repositories;

import com.example.tutorsFinderSystem.entities.Ebook;
import com.example.tutorsFinderSystem.enums.EbookType;

import java.time.LocalDate;
import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

// import java.util.List;

public interface EbookRepository extends JpaRepository<Ebook, Long> {

    // List<Ebook> findByType(EbookType type);

    // List<Ebook> findByTitleContainingIgnoreCase(String keyword);

    // List<Ebook> findByTypeAndTitleContainingIgnoreCase(EbookType type, String
    // keyword);

    Page<Ebook> findByType(EbookType type, Pageable pageable);

    List<Ebook> findTop4ByOrderByCreatedAtDesc();

    Page<Ebook> findByTitleContainingIgnoreCase(String keyword, Pageable pageable);

    Page<Ebook> findByTypeAndTitleContainingIgnoreCase(EbookType type, String keyword, Pageable pageable);

    @Query("""
    SELECT e FROM Ebook e
    WHERE (:type IS NULL OR e.type = :type)
      AND (:createdDate IS NULL OR DATE(e.createdAt) = :createdDate)
""")
    Page<Ebook> searchEbooks(
            @Param("type") EbookType type,
            @Param("createdDate") LocalDate createdDate,
            Pageable pageable
    );
}
