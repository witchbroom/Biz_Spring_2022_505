package com.root.emr.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/api")
public class ApiController {

	@RequestMapping(value= {"/",""},method=RequestMethod.GET)
	public String wather(Model model) throws IOException {
		String apiUrl = "http://apis.data.go.kr/B551182/mdfeeCrtrInfoService/getDiagnossMdfeeList";

		String serviceKey = "b3x4XhEFjl7FU74IshbDUiuryg1lxf2%2FIM5nrbhmP9Qle0suViEGy3srthqfNwuY6M4bc%2B%2BBLjkJgofgbNLu4Q%3D%3D";
		String pageNo = "1"; // 페이지 번호
		String numOfRow = "10"; // 한 페이지 결과 수
		String korNm = "신생아";

		StringBuilder urlBuilder = new StringBuilder(apiUrl);
		urlBuilder.append("?" + URLEncoder.encode("ServiceKey", "UTF-8") + "=" + serviceKey);
		urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("numOfRow", "UTF-8") + "=" + URLEncoder.encode(numOfRow, "UTF-8"));
		urlBuilder.append("&" + URLEncoder.encode("korNm", "UTF-8") + "=" + URLEncoder.encode(korNm, "UTF-8"));


		log.debug(" {} ",urlBuilder);
		
		
		URL url = new URL(urlBuilder.toString());
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json");
		System.out.println("Response code: " + conn.getResponseCode());
		BufferedReader rd;
		if (conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
			rd = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		} else {
			rd = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
		}

		StringBuilder sb = new StringBuilder();
		String line;
		while ((line = rd.readLine()) != null) {
			sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String result = sb.toString();
		System.out.println(result);
		model.addAttribute("APIS", result);

		return "home";
	}

}
