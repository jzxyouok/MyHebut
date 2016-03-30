package com.hebut.config;

import java.io.InputStream;
import java.util.Properties;

public class SystemProperties {
	private static Properties props = new Properties();
	
	static {
		try {
			InputStream in = SystemProperties.class.getResourceAsStream("/system.properties");
			props.load(in);
			in.close();
			putProperties();
		} catch (Exception e) {
			System.out.println(e);
		}
	}
	
	private static String accessKeyId;
	
	private static String accessKeySecret;
	
	private static String endpoint;

	private static void putProperties() {
		accessKeyId = props.getProperty("accessKeyId");
		accessKeySecret = props.getProperty("accessKeySecret");
		endpoint = props.getProperty("endpoint");
	}

	public static String getAccessKeyId() {
		return accessKeyId;
	}

	public static void setAccessKeyId(String accessKeyId) {
		SystemProperties.accessKeyId = accessKeyId;
	}

	public static String getAccessKeySecret() {
		return accessKeySecret;
	}

	public static void setAccessKeySecret(String accessKeySecret) {
		SystemProperties.accessKeySecret = accessKeySecret;
	}

	public static String getEndpoint() {
		return endpoint;
	}

	public static void setEndpoint(String endpoint) {
		SystemProperties.endpoint = endpoint;
	}

}