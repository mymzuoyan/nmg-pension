package com.fedtech.commons.utils;

import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Map;
import java.util.TreeMap;

class OAuthRequest {
	private static final String OAUTH_PREFIX = "oauth_";
	private TreeMap<String, String> oauthParameters;
	private String realm;
	private static final String CONTENT_LENGTH = "Content-Length";
	public static final String CONTENT_TYPE = "Content-Type";
	public static final String DEFAULT_CONTENT_TYPE = "application/x-www-form-urlencoded";
	public static final int REQUEST_TEMP_TOKEN = 0;
	public static final int AUTHORIZATION = 1;
	public static final int REQUEST_ACCESS_TOKEN = 2;
	public static final int PACK_ACCESS_TOKEN = 3;

	public static final String TIMESTAMP = "oauth_timestamp";
	public static final String SIGN_METHOD = "oauth_signature_method";
	public static final String SIGNATURE = "oauth_signature";
	public static final String CONSUMER_SECRET = "oauth_consumer_secret";
	public static final String CONSUMER_KEY = "oauth_consumer_key";
	public static final String CALLBACK = "oauth_callback";
	public static final String VERSION = "oauth_version";
	public static final String NONCE = "oauth_nonce";
	public static final String REALM = "realm";
	public static final String PARAM_PREFIX = "oauth_";
	public static final String TOKEN = "oauth_token";
	public static final String TOKEN_SECRET = "oauth_token_secret";
	public static final String OUT_OF_BAND = "oob";
	public static final String VERIFIER = "oauth_verifier";
	public static final String HEADER = "Authorization";
	public static final String SCOPE = "scope";

	//OAuth 2.0
	public static final String ACCESS_TOKEN = "access_token";
	public static final String CLIENT_ID = "client_id";
	public static final String CLIENT_SECRET = "client_secret";
	public static final String REDIRECT_URI = "redirect_uri";
	public static final String CODE = "code";
	  
	private String url;
	private String verb;
	private String queryStr;
	private String tokenSecret;
	private TreeMap<String, String> headers;
	private String charset;
	
	private static final char QUERY_STRING_SEPARATOR = '?';
	private static final String PARAM_SEPARATOR = "&";
	private static final String PAIR_SEPARATOR = "=";
	private static final String EMPTY_STRING = "";
	private TreeMap<String, String> bodyMap;
	private TreeMap<String, String> queryStringMap;
	public ArrayList<TreeMap<String, String>> bodyList = new ArrayList<TreeMap<String, String>>();
	public ArrayList<TreeMap<String, String>> queryStringList1 = new ArrayList<TreeMap<String, String>>();
	private TreeMap<String, String> queryDict;
	public String appendTo(String url)
	{
		String queryString = asFormUrlEncodedString();
	    if (queryString.equals(EMPTY_STRING))
	    {
	      return url;
	    }
	    else
	    {
	      url += url.indexOf(QUERY_STRING_SEPARATOR) != -1 ? PARAM_SEPARATOR : QUERY_STRING_SEPARATOR;
	      url += queryString;
	      return url;
	    }
	  }
	  
	  public String asUrlEncodedPair(String key, String value)
	  {
	    return MiscUtil.encodeURL(key).concat("=").concat(MiscUtil.encodeURL(value));
	  }
	  
	  public String asFormUrlEncodedString()
	  {
	    StringBuilder builder = new StringBuilder();
	    for(int i = 0; i < oauthParameters.keySet().size(); i++)
	    {
	      builder.append('&').append(asUrlEncodedPair(oauthParameters.keySet().toArray()[i].toString(),
	    		  oauthParameters.values().toArray()[i].toString()));
	    }
	    return builder.toString().substring(1);
	  }
	  
	public OAuthRequest(String verb, String url) {
		this.verb = verb;
		this.url = url;
		this.headers = new TreeMap<String, String>();
		this.oauthParameters = new TreeMap<String, String>();
	}

	/**
	 * Adds an OAuth parameter.
	 * 
	 * @param key
	 *            name of the parameter
	 * @param value
	 *            value of the parameter
	 * 
	 * @throws IllegalArgumentException
	 *             if the parameter is not an OAuth parameter
	 */
	public void addOAuthParameter(String key, String value) {
		oauthParameters.put(checkKey(key), value);
	}

	private String checkKey(String key) {
		if (key.startsWith(OAUTH_PREFIX) || key.equals(SCOPE)) {
			return key;
		} else {
			throw new IllegalArgumentException(String.format(
					"OAuth parameters must either be '%s' or start with '%s'",
					SCOPE, OAUTH_PREFIX));
		}
	}

	/**
	 * Returns the {@link Map} containing the key-value pair of parameters.
	 * 
	 * @return parameters as map
	 */
	public TreeMap<String, String> getOauthParameters() {
		return oauthParameters;
	}

	public void setRealm(String realm) {
		this.realm = realm;
	}

	public String getRealm() {
		return realm;
	}

	@Override
	public String toString() {
		return String.format("@OAuthRequest(%s, %s)", getVerb(), getUrl());
	}

	/**
	 * Returns the complete url (host + resource + encoded querystring
	 * parameters).
	 * 
	 * @return the complete url.
	 */
	public String getCompleteUrl() {
		return appendTo(url);
	}

	/**
	 * Add an HTTP Header to the Request
	 * 
	 * @param key
	 *            the header name
	 * @param value
	 *            the header value
	 */
	public void addHeader(String key, String value) {
		this.headers.put(key, value);
	}

	/**
	 * Add a body Parameter (for POST/ PUT Requests)
	 * 
	 * @param key
	 *            the parameter name
	 * @param value
	 *            the parameter value
	 */
	public void addBodyParameter(String key, String value) {
		this.bodyMap.put(key, value);
	}

	/**
	 * Add a QueryString parameter
	 * 
	 * @param key
	 *            the parameter name
	 * @param value
	 *            the parameter value
	 */
	public void addQuerystringParameter(String key, String value) {
		this.queryStringMap.put(key, value);
	}


	/**
	 * Obtains the URL of the HTTP Request.
	 * 
	 * @return the original URL of the HTTP Request
	 */
	public String getUrl() {
		return url;
	}

	/**
	 * Returns the URL without the default port and the query string part.
	 * 
	 * @return the OAuth-sanitized URL
	 */
	public String getSanitizedUrl() {
		if (url.startsWith("http://")
				&& (url.endsWith(":80") || url.contains(":80/"))) {
			return url.replaceAll("\\?.*", "").replaceAll(":80", "");
		} else if (url.startsWith("https://")
				&& (url.endsWith(":443") || url.contains(":443/"))) {
			return url.replaceAll("\\?.*", "").replaceAll(":443", "");
		} else {
			return url.replaceAll("\\?.*", "");
		}
	}

	/**
	 * Returns the HTTP Verb
	 * 
	 * @return the verb
	 */
	public String getVerb() {
		return verb;
	}

	/**
	 * Returns the connection headers as a {@link Map}
	 * 
	 * @return map of headers
	 */
	public TreeMap<String, String> getHeaders() {
		return headers;
	}

	/**
	 * Returns the connection charset. Defaults to {@link Charset}
	 * defaultCharset if not set
	 * 
	 * @return charset
	 */
	public String getCharset() {
		return charset == null ? Charset.defaultCharset().name() : charset;
	}


	/**
	 * Set the charset of the body of the request
	 * 
	 * @param charsetName
	 *            name of the charset of the request
	 */
	public void setCharset(String charsetName) {
		this.charset = charsetName;
	}

	public void setQueryData(TreeMap<String, String> dict) {
		this.queryDict = dict;
	}

	public TreeMap<String, String> getQueryData()
	{
		return this.queryDict;
	}
}
