package com.connectto.guide.client;

import com.connectto.guide.controller.dto.ResponseDto;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.util.Arrays;
import static com.connectto.guide.client.ClientConstant.*;

/**
 * Created by User on 29.04.2017.
 */
public class Client {
    public static final String REST_SERVICE_URI = "http://localhost:8888";

    /*
     * Add HTTP Authorization header, using Basic-Authentication to send user-credentials.
     */
    private static HttpHeaders getHeaders() {
        HttpHeaders headers = new HttpHeaders();
        headers.add(HEADER_AUTHORIZATION, HEADER_TOKEN);
        headers.setAccept(Arrays.asList(MediaType.APPLICATION_JSON));
        return headers;
    }


    private static void mobileIPTVLanguages() {
        System.out.println("\nTesting mobileIPTVLanguages API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_LANGUAGES, HttpMethod.GET, request, ResponseDto.class);
        ResponseDto user = response.getBody();
        System.out.println(user);
    }

    private static void mobileChannelCategories() {
        System.out.println("\nTesting mobileChannelCategories API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_CATEGORIES, HttpMethod.GET, request, ResponseDto.class);
        ResponseDto user = response.getBody();
        System.out.println(user);
    }

    public static void main(String args[]) {
        mobileIPTVLanguages();
        mobileChannelCategories();

    }
}