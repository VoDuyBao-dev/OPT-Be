package com.example.tutorsFinderSystem.dto.chat;

import lombok.AllArgsConstructor;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class StickerResponse {
    private Long id;
    private String imageUrl;
}
