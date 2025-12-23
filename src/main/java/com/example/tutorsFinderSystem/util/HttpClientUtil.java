package com.example.tutorsFinderSystem.util;

import com.example.tutorsFinderSystem.exceptions.AppException;
import com.example.tutorsFinderSystem.exceptions.ErrorCode;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.util.Map;

@Slf4j
public class HttpClientUtil {

    public static String post(String url, Map<String, String> params) {
        try {
            RestTemplate restTemplate = new RestTemplate();

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_JSON);

            // Convert Map to JSON
            ObjectMapper objectMapper = new ObjectMapper();
            String jsonBody = objectMapper.writeValueAsString(params);

            log.info("Request URL: {}", url);
            log.info("Request Body: {}", jsonBody);

            HttpEntity<String> requestEntity = new HttpEntity<>(jsonBody, headers);

            ResponseEntity<String> response = restTemplate.exchange(
                    url,
                    HttpMethod.POST,
                    requestEntity,
                    String.class
            );

            log.info("Response: {}", response.getBody());
            return response.getBody();

        } catch (Exception e) {
            log.error("HTTP POST error: ", e);
            throw new AppException(ErrorCode.FAILED_TO_CALL_VNPAY);
        }
    }
}