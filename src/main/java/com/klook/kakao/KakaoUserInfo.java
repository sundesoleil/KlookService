package com.klook.kakao;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

public class KakaoUserInfo {
  public static JsonNode getKakaoUserInfo(JsonNode accessToken) {
	  
	     Logger logger = LoggerFactory.getLogger(KakaoUserInfo.class);

         final String RequestUrl = "https://kapi.kakao.com/v2/user/me";
         final HttpClient client = HttpClientBuilder.create().build();
         final HttpPost post = new HttpPost(RequestUrl);
 
         post.addHeader("Authorization", "Bearer " + accessToken);  // 토큰으로 authorization 권한 얻기
  
         JsonNode returnNode = null;
 
         try {
             final HttpResponse response = client.execute(post);
             final int responseCode = response.getStatusLine().getStatusCode();
             final String msg=response.getStatusLine().getReasonPhrase();
             
             System.out.println("\nSending 'POST' request to URL : " + RequestUrl);
             System.out.println("Response Code : " + responseCode);
             System.out.println("Response Code : " + msg);

             // JSON 형태 반환값 처리
             ObjectMapper mapper = new ObjectMapper();
             returnNode = mapper.readTree(response.getEntity().getContent());  
  
         } catch (ClientProtocolException e) {
             e.printStackTrace();
         } catch (IOException e) {
             e.printStackTrace();
         } finally {
         }
         return returnNode;
     }
  public JsonNode Logout(String autorize_code) {
		
      final String RequestUrl = "https://kapi.kakao.com/v1/user/logout";
      final HttpClient client = HttpClientBuilder.create().build();
      final HttpPost post = new HttpPost(RequestUrl);

      post.addHeader("Authorization", "Bearer " + autorize_code);

      JsonNode returnNode = null;

      try {
          final HttpResponse response = client.execute(post);
          ObjectMapper mapper = new ObjectMapper();
          returnNode = mapper.readTree(response.getEntity().getContent());

      } catch (UnsupportedEncodingException e) {
          e.printStackTrace();

      } catch (ClientProtocolException e) {
          e.printStackTrace();

      } catch (IOException e) {
          e.printStackTrace();

      } finally {
      }

      return returnNode;

  }
}