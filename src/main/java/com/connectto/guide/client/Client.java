package com.connectto.guide.client;

import com.connectto.guide.controller.dto.ResponseDto;
import org.springframework.http.*;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
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

    private static void channel(Long channelId) {
        System.out.println("\nTesting channel API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Object> request = new HttpEntity<Object>(  getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_CHANNEL + "/"+channelId, HttpMethod.GET, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    private static void channelCount() {

        String state = "";
        String body = "{\"statename\":\"" + state + "\"}";

        MultiValueMap<String, String> map = new LinkedMultiValueMap<String, String>();
        map.add("existsChannelIdes", "123");
        map.add("channelUpdateDate", "456");

        System.out.println("\nTesting channel API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Object> request = new HttpEntity<Object>(getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_CHANNEL_COUNT , HttpMethod.GET, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    private static void channelIdes() {
        System.out.println("\nTesting channel API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Object> request = new HttpEntity<Object>( getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_CHANNEL_IDES , HttpMethod.GET, request, ResponseDto.class);
        ResponseDto dto = response.getBody();
        System.out.println(dto);
    }

    private static void xmlTv(Long channelId) {
        System.out.println("\nTesting URL_XML_TV API----------");
        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<Object> request = new HttpEntity<Object>( getHeaders());
        ResponseEntity<ResponseDto> response = restTemplate.exchange(REST_SERVICE_URI + URL_XML_TV + "/"+channelId , HttpMethod.GET, request, ResponseDto.class);
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
//        mobileIPTVLanguages();
//        mobileChannelCategories();
//
//        favorite();
//        unFavorite();
//        block();
//        unblock();
//        blockHttpURLConnection();
        String ides = "118,105,107,108,144,53,54,55,104,117,119,120,124,125,239,224,154,174,169,209,234,115,164,229,149,214,219,204,199,244,134,129,139,249,32,11,14,27,28,13,43,47,25,29,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,33,77,79,80,81,82,34,37,38,39,83,40,41,42,44,45,46,48,51,84,85,86,87,88,89,90,91,92,93,24,94,95,96,97,98,99,100,101,127,102,103,36";
//        channel(118L);
//        channelCount();
//        channelIdes();
        for(String id : ides.split(",")){
            xmlTv(Long.parseLong(id));
        }

    }
}