package com.yuan.common.feige;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

import com.yuan.common.constant.FeigeConstants;
import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.entity.UrlEncodedFormEntity;

import org.apache.http.client.methods.HttpPost;
import org.apache.http.concurrent.FutureCallback;
import org.apache.http.impl.nio.client.CloseableHttpAsyncClient;
import org.apache.http.impl.nio.client.HttpAsyncClients;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.stereotype.Service;

@Service
public class FeigeService {

    static String requestUrl = "http://api.feige.ee/SmsService/Send";
    static String Account = "1774328193";
    static String Pwd = "3d3382a16c27e67a2cb6817c8";
    static String SignId = "54564";
    static List<NameValuePair> formparams = new ArrayList<NameValuePair>();

    static {
        formparams.add(new BasicNameValuePair(FeigeConstants.Account_key, FeigeConstants.ACCOUNT_VALUE));
        formparams.add(new BasicNameValuePair(FeigeConstants.PWD_KEY, FeigeConstants.PWD_VALUE));
        formparams.add(new BasicNameValuePair(FeigeConstants.SIGNID_KEY, FeigeConstants.SIGNID_VALUE));
    }


    public static void sendFeige(String mobile, String content) {
        try {
            formparams.add(new BasicNameValuePair(FeigeConstants.Content_key, content));
            formparams.add(new BasicNameValuePair(FeigeConstants.Mobile_key, mobile));
            Post(formparams);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static void Post(List<NameValuePair> formparams) throws Exception {
        CloseableHttpAsyncClient httpClient = HttpAsyncClients.createDefault();
        httpClient.start();
        HttpPost requestPost = new HttpPost(requestUrl);
        requestPost.setEntity(new UrlEncodedFormEntity(formparams, "utf-8"));
        httpClient.execute(requestPost, new FutureCallback<HttpResponse>() {
            @Override
            public void failed(Exception arg0) {
                System.out.println("Exception: " + arg0.getMessage());
            }

            @Override
            public void completed(HttpResponse arg0) {
                System.out.println("Response: " + arg0.getStatusLine());
                try {
                    InputStream stram = arg0.getEntity().getContent();
                    BufferedReader reader = new BufferedReader(new InputStreamReader(stram));
                    System.out.println(reader.readLine());

                } catch (UnsupportedOperationException e) {
                    e.printStackTrace();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
            @Override
            public void cancelled() {
                // TODO Auto-generated method stub
            }
        }).get();
        System.out.println("Done");
    }


     public static void main(String[] args) {
         sendFeige("17752579193","mytest xiaolu");
      }
}
