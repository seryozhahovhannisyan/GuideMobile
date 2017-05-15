package com.connectto.guide.client;

import com.connectto.guide.controller.dto.ResponseDto;
import org.springframework.http.*;
import org.springframework.web.client.RestTemplate;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
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
        try{
            ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_LANGUAGES, HttpMethod.GET, request, ResponseDto.class);
            ResponseDto dto = response.getBody();
            System.out.println(dto);
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    private static void mobileChannelCategories() {
        System.out.println("\nTesting mobileChannelCategories API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_CATEGORIES, HttpMethod.GET, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    private static void favorite() {
        System.out.println("\nTesting favorite API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_FAVORITE + "/118", HttpMethod.POST, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    private static void unFavorite() {
        System.out.println("\nTesting unFavorite API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> request = new HttpEntity<String>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_UN_FAVORITE + "/118", HttpMethod.POST, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    private static void block() {
        System.out.println("\nTesting create Block API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Object> request = new HttpEntity<Object>("1234", getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_BLOCK + "/118", HttpMethod.POST, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    private static void unblock() {
        System.out.println("\nTesting create UnBlock API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Object> request = new HttpEntity<Object>("12as", getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_UN_BLOCK + "/118", HttpMethod.POST, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    public static synchronized String blockHttpURLConnection() {
        URL url;
        HttpURLConnection urlConn = null;
        StringBuffer responseResult = new StringBuffer();

        DataOutputStream wr = null;
        BufferedWriter writer = null;
        BufferedReader in = null;

        try {

            url = new URL(REST_SERVICE_URI + URL_BLOCK + "/118");
            urlConn = (HttpURLConnection) url.openConnection();
            urlConn.setDoInput(true);
            urlConn.setDoOutput(true);
            urlConn.setUseCaches(false);
            urlConn.setRequestProperty("Content-Type", "application/json");
            urlConn.setRequestMethod("POST");
            urlConn.setRequestProperty(HEADER_AUTHORIZATION, HEADER_TOKEN);
            urlConn.connect();

            wr = new DataOutputStream(urlConn.getOutputStream());
            writer = new BufferedWriter(new OutputStreamWriter(wr, "UTF-8"));
            writer.write("12as");

            if (writer != null) {
                try {
                    writer.flush();
                    writer.close();
                } catch (IOException e) {
                }
            }


            in = new BufferedReader(new InputStreamReader(urlConn.getInputStream()));
            String inputLine;
            responseResult = new StringBuffer();

            while ((inputLine = in.readLine()) != null) {
                responseResult.append(inputLine);
            }

            if (in != null) {
                in.close();
            }

        } catch (Exception e) {
        } finally {

            if (wr != null) {
                try {
                    wr.flush();
                    wr.close();
                } catch (IOException e) {
                }
            }

            if (urlConn != null) {
                try {
                    urlConn.disconnect();
                } catch (Exception e) {
                }
            }

        }

        return responseResult.toString();
    }

    public static void main(String args[]) {
        mobileIPTVLanguages();
//        mobileChannelCategories();
//
//        favorite();
//        unFavorite();
//        block();
//        unblock();
//        blockHttpURLConnection();

    }
}