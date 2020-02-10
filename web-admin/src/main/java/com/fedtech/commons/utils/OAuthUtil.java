package com.fedtech.commons.utils;

import java.awt.*;
import java.util.Arrays;
import java.util.HashMap;
import java.util.TreeMap;

public class OAuthUtil {
    private String apiKey;
    private String apiSecret;
    private final String callback = "http://www.linktopcss.com/ready";

    private String token_Secret = "";
    private String verifier = "";
    private String callbackUrl;
    private Object locker = new Object();
    private Dialog dialog;
    private String username;
    private String password;

    protected OAuthUtil(String key, String secret, String username, String password) {
        this.apiKey = key;
        this.apiSecret = secret;
        this.username = username;
        this.password = password;
    }


    public static String getSignature(String requestUrl, HashMap<String, String> dict,
                                      String verb, String apiKey, String apiSecret) {
        OAuthRequest request = new OAuthRequest(verb, requestUrl);
        System.out.println("http_method:" + verb);
        System.out.println("url:" + requestUrl);
        TreeMap<String, String> map = new TreeMap<String, String>();

        if (dict != null) {
            map.putAll(dict);
        }
        request.setQueryData(map);
        return calSignature(request, apiKey, apiSecret);

    }

    private static String calSignature(OAuthRequest request, String apiSecret, String tokenSecret) {
        TreeMap<String, String> queryData = request.getQueryData();
        StringBuilder strBuilder = new StringBuilder();
        for (String key : request.getQueryData().keySet()) {
            strBuilder.append(key + "=" + queryData.get(key));
        }
        String baseString = request.getVerb() + request.getUrl() + strBuilder.toString() + tokenSecret;
        System.out.println("query_str:" + strBuilder.toString());
        baseString = MiscUtil.encodeURL(baseString);
        System.out.println("url_quote:" + baseString);
        System.out.println("secret_key:" + tokenSecret);
        String signature = RsyncUtils.cal_MD5(baseString.getBytes());
        System.out.println("_sign:" + signature);
        return signature;
    }
}
