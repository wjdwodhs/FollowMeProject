package com.fz.followme.controller;

import java.net.URI;
import java.nio.charset.StandardCharsets;
import java.util.List;

import org.springframework.http.HttpHeaders;
import org.springframework.http.RequestEntity;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.fz.followme.dto.OrderDto;
import com.fz.followme.service.OrderService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RequestMapping("/chart")
@RestController
public class ChartController {
	
	private final OrderService orderService;

	
	@GetMapping("/revenue.do")
	public List<OrderDto> selectOrder() {
		return orderService.selectOrder();
	}
	
	
	@GetMapping("/naverNews.do")
	public ResponseEntity<String> getNaverNews() {
        String clientId = "Icsu9Z4AFgHEk4gCROsJ"; // 애플리케이션 클라이언트 아이디
        String clientSecret = "v7cwu7ppik"; // 애플리케이션 클라이언트 시크릿
        String query = "패션"; // 검색어

        String encodedQuery = java.net.URLEncoder.encode(query, StandardCharsets.UTF_8);
        String apiUrl = "https://openapi.naver.com/v1/search/news.json?query=" + encodedQuery + "&display=100&start=1&sort=date";

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Naver-Client-Id", clientId);
        headers.add("X-Naver-Client-Secret", clientSecret);

        RequestEntity<Void> req = RequestEntity
                .get(URI.create(apiUrl))
                .headers(headers)
                .build();

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(req, String.class);
        return response;
    }
	
	@GetMapping("/naverBlog.do")
	public ResponseEntity<String> getNaverBlog() {
        String clientId = "Icsu9Z4AFgHEk4gCROsJ"; // 애플리케이션 클라이언트 아이디
        String clientSecret = "v7cwu7ppik"; // 애플리케이션 클라이언트 시크릿
        String query = "패션"; // 검색어

        String encodedQuery = java.net.URLEncoder.encode(query, StandardCharsets.UTF_8);
        String apiUrl = "https://openapi.naver.com/v1/search/blog.json?query=" + encodedQuery + "&display=100&start=1&sort=date";

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-Naver-Client-Id", clientId);
        headers.add("X-Naver-Client-Secret", clientSecret);

        RequestEntity<Void> req = RequestEntity
                .get(URI.create(apiUrl))
                .headers(headers)
                .build();

        RestTemplate restTemplate = new RestTemplate();
        ResponseEntity<String> response = restTemplate.exchange(req, String.class);
        return response;
    }
}
