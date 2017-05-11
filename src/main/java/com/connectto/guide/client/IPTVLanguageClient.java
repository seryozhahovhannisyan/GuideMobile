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
    public static final String REST_SERVICE_URI = "http://localhost:8080";

    /*
     * Add HTTP Authorization header, using Basic-Authentication to send user-credentials.
     */
    private static HttpHeaders getHeaders() {
        String plainCredentials = "john123:password";
        String base64Credentials = new String(Base64.encode(plainCredentials.getBytes()));

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "Basic am9objEyMzpwYXNzd29yZA==");
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        return headers;
    }


    private static void mobileIPTVLanguages() {
        System.out.println("\nTesting getUser API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + "/m-iptv-languages.htm", HttpMethod.GET, request, ResponseDto.class);
        ResponseDto user = response.getBody();
        System.out.println(user);
    }

    private static void userHtm() {
        System.out.println("\nTesting getUser API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<User> response = restTemplate.exchange(REST_SERVICE_URI + "/user.htm", HttpMethod.GET, request, User.class);
        User user = response.getBody();
        System.out.println(user);
    }

    public static void main(String args[]) {
//        mobileIPTVLanguages();
        userHtm();
    }
}