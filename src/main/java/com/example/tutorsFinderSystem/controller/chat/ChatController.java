package com.example.tutorsFinderSystem.controller.chat;

import com.example.tutorsFinderSystem.dto.chat.ChatConversationResponse;
import com.example.tutorsFinderSystem.dto.chat.ChatHistoryResponse;
import com.example.tutorsFinderSystem.dto.chat.StickerResponse;
import com.example.tutorsFinderSystem.dto.chat.UserMeResponse;
import com.example.tutorsFinderSystem.entities.User;
import com.example.tutorsFinderSystem.repositories.StickerRepository;
import com.example.tutorsFinderSystem.services.ChatService;
import com.example.tutorsFinderSystem.services.GoogleDriveService;
import com.example.tutorsFinderSystem.services.UserService;

import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.*;
import org.springframework.security.core.GrantedAuthority;

import java.security.Principal;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/chat")
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;
    private final UserService userService;
    private final StickerRepository stickerRepository;
    private final GoogleDriveService googleDriveService;

    @GetMapping("/stickers")
    public List<StickerResponse> getAll() {

        return stickerRepository.findAll().stream()
                .map(s -> new StickerResponse(
                        s.getStickerId(),
                        googleDriveService.buildAvatarUrl(
                                s.getImageUrl() // fileId
                        )))
                .toList();
    }

    /**
     * Sidebar – danh sách hội thoại
     */
    @GetMapping("/conversations")
    public List<ChatConversationResponse> getConversations() {

        String email = SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getName();

        return chatService.getConversations(email);
    }

    /**
     * Lịch sử chat – lazy load
     */
    @GetMapping("/history/{userId}")
    public Page<ChatHistoryResponse> getChatHistory(
            @PathVariable Long userId,
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "20") int size) {

        String email = SecurityContextHolder
                .getContext()
                .getAuthentication()
                .getName();

        return chatService.getChatHistory(email, userId, page, size);
    }

    @GetMapping("/me")
    public UserMeResponse me() {

        User user = userService.getCurrentUser();

        String role = SecurityContextHolder.getContext()
                .getAuthentication()
                .getAuthorities()
                .stream()
                .findFirst()
                .map(GrantedAuthority::getAuthority)
                .orElse(null);

        return new UserMeResponse(
                user.getUserId(),
                user.getEmail(),
                user.getFullName(),
                role);
    }

    @PostMapping("/read/{otherUserId}")
    public ResponseEntity<?> markAsRead(
            @PathVariable Long otherUserId,
            Principal principal
    ) {
        int updated = chatService.markConversationAsRead(
                principal.getName(),
                otherUserId
        );

        return ResponseEntity.ok(Map.of(
                "updated", updated
        ));
    }

}
