package com.voyagerproject.util;

import java.io.UnsupportedEncodingException;
import java.util.Date;

import org.apache.commons.lang3.time.DateUtils;

import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

public class ModelUtils {	
	// Secret used to encrypt JWTs
	private static String secret = "JWTSecret1111";
	
	/**
	 * Creates a JWT valid for 12 hours for a specific userName
	 * 
	 * @param userName
	 * @return String JWT
	 * @throws UnsupportedEncodingException
	 */
	public static String createUserToken(String userName) throws UnsupportedEncodingException{		

		// Creates a token valid for the next 12 hours
		String jwt = Jwts.builder()
				.setExpiration(DateUtils.addHours(new Date(), 12))
				.claim("name", userName)
				.signWith(
						SignatureAlgorithm.HS256,
						secret.getBytes("UTF-8")
						)
				.compact();

		return jwt;
	}

}