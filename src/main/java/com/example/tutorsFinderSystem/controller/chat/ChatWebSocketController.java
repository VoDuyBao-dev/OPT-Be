package com.example.tutorsFinderSystem.controller.chat;

import java.security.Principal;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.example.tutorsFinderSystem.dto.chat.ChatMessageRequest;
import com.example.tutorsFinderSystem.entities.ChatMessage;
import com.example.tutorsFinderSystem.entities.User;
import com.example.tutorsFinderSystem.repositories.UserRepository;
import com.example.tutorsFinderSystem.services.ChatService;
import com.example.tutorsFinderSystem.services.GoogleDriveService;
import com.example.tutorsFinderSystem.dto.chat.ChatMessageResponse;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class ChatWebSocketController {

    private final SimpMessagingTemplate messagingTemplate;
    private final UserRepository userRepository;
    private final ChatService chatService;
    private final GoogleDriveService googleDriveService;

    @MessageMapping("/chat.send")
    public void sendMessage(ChatMessageRequest req, Principal principal) {

        String senderEmail = principal.getName();
        User sender = userRepository.findByEmail(senderEmail)
                .orElseThrow(() -> new RuntimeException("Sender not found"));

        User receiver = userRepository.findById(req.getReceiverId())
                .orElseThrow(() -> new RuntimeException("Receiver not found"));

        // LƯU DB QUA SERVICE (ĐÂY LÀ CHỖ QUAN TRỌNG NHẤT)
        ChatMessage saved = chatService.saveMessage(senderEmail, req);
        if (saved.getSticker() != null) {
            saved.getSticker().setImageUrl(
                    googleDriveService.buildAvatarUrl(saved.getSticker().getImageUrl()));
        }
        // 3. Convert Entity -> DTO
        ChatMessageResponse payload = ChatMessageResponse.from(saved);

        // 4. Gửi cho người nhận
        messagingTemplate.convertAndSendToUser(
                saved.getReceiver().getEmail(),
                "/queue/messages",
                payload);

        // 5. Echo lại cho người gửi
        messagingTemplate.convertAndSendToUser(
                senderEmail,
                "/queue/messages",
                payload);

        // push unreadCount realtime cho người nhận
        chatService.pushUnread(receiver);
    }

}
