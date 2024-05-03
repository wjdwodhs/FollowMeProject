package com.fz.followme.service;

import java.util.HashMap;

import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class CheckAccountService {
	
	public HashMap<String, String> getAccessToken1(String bankCode, String bankNumber) {
        HashMap<String, String> map = new HashMap<>();
        String impKey = "7475825060345027";
        String impSecret = "FdjI9LGz63uOppHzaJEDtuD1lGJA7egDcSr1KXLuWc8bXcSumJbbUnbMJf1s2xC13wYrNHN5uZz1X71I";

        // RestTemplate 객체 생성
        RestTemplate restTemplate = new RestTemplate();

        // POST 요청을 위한 HttpHeaders 객체 생성 및 설정
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        // POST 요청에 전달할 데이터 설정
        JSONObject requestData = new JSONObject();
        requestData.put("imp_key", impKey);
        requestData.put("imp_secret", impSecret);

        // HttpEntity 객체 생성 및 설정
        HttpEntity<String> requestEntity = new HttpEntity<>(requestData.toString(), headers);

        // 토큰 요청 보내기
        ResponseEntity<String> responseEntity = restTemplate.postForEntity(
            "https://api.iamport.kr/users/getToken", 
            requestEntity, 
            String.class
        );

        // 응답 코드 확인
        HttpStatus statusCode = responseEntity.getStatusCode();
        if (statusCode == HttpStatus.OK) { // 성공
            String responseBody = responseEntity.getBody();
            JSONObject jsonResponse = new JSONObject(responseBody);
            String accessToken = jsonResponse.getJSONObject("response").getString("access_token");

            // GET 요청 보내기
            HttpHeaders getHeaders = new HttpHeaders();
            getHeaders.setContentType(MediaType.APPLICATION_JSON);
            getHeaders.set("Authorization", "Bearer " + accessToken);

            HttpEntity<String> getRequestEntity = new HttpEntity<>(getHeaders);

            ResponseEntity<String> getResponseEntity = restTemplate.exchange(
                "https://api.iamport.kr/vbanks/holder?bank_code=" + bankCode + "&bank_num=" + bankNumber,
                HttpMethod.GET,
                getRequestEntity,
                String.class
            );

            // 응답 코드 확인
            HttpStatus getStatusCode = getResponseEntity.getStatusCode();
            if (getStatusCode == HttpStatus.OK) {
                String getResponseBody = getResponseEntity.getBody();
                JSONObject getJsonResponse = new JSONObject(getResponseBody);
                String bankHolderInfo = getJsonResponse.getJSONObject("response").getString("bank_holder");

                map.put("bankHolderInfo", bankHolderInfo);
            } else {
                map.put("error", String.valueOf(getStatusCode.value()));
            }
        } else {
            map.put("error", String.valueOf(statusCode.value()));
        }

        return map;
    }
	
	
}
