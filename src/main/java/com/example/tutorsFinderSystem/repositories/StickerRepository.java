package com.example.tutorsFinderSystem.repositories;

import com.example.tutorsFinderSystem.entities.Sticker;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;

public interface StickerRepository extends JpaRepository<Sticker, Long> {
    Optional<Sticker> findByImageUrl(String imageUrl);
}
