package com.connectto.guide.client;

import com.connectto.guide.controller.dto.ResponseDto;
import com.connectto.guide.entity.User;
import org.springframework.http.*;
import org.springframework.security.crypto.codec.Base64;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.util.Arrays;
import java.util.LinkedHashMap;
import java.util.List;

/**
 * Created by User on 29.04.2017.
 */
public class IPTVLanguageClient {
    public static final String REST_SERVICE_URI = "http://localhost:8888";

    /*
     * Add HTTP Authorization header, using Basic-Authentication to send user-credentials.
     */
    private static HttpHeaders getHeaders() {
        String plainCredentials = "GSI4N4165R4DGPOPQVBZ0L6MBVG37E5Z:password";
        String base64Credentials = new String(Base64.encode(plainCredentials.getBytes()));

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Basic WHI68DSF450UDWO616N3Q89FDSVA4GYW" );
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        return headers;
    }


    private static void mobileIPTVLanguages() {
        System.out.println("\nTesting getUser API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + "/m-iptv-languages", HttpMethod.GET, request, ResponseDto.class);
        ResponseDto user = response.getBody();
        System.out.println(user);
    }

    public static void main(String args[]) {
        mobileIPTVLanguages();
    }
}