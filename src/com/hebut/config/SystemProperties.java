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

	private static String sendUser;

	private static String sendPassword;

	private static String receiver;

	private static void putProperties() {
		accessKeyId = props.getProperty("accessKeyId");
		accessKeySecret = props.getProperty("accessKeySecret");
		endpoint = props.getProperty("endpoint");
		sendUser = props.getProperty("sendUser");
		sendPassword = props.getProperty("sendPassword");
		receiver = props.getProperty("receiver");
	}

	public static String getAccessKeyId() {
		return accessKeyId;
	}

	public static String getAccessKeySecret() {
		return accessKeySecret;
	}

	public static String getEndpoint() {
		return endpoint;
	}

	public static String getSendUser() {
		return sendUser;
	}

	public static String getSendPassword() {
		return sendPassword;
	}

	public static String getReceiver() {
		return receiver;
	}

}