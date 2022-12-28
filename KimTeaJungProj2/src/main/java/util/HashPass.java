package util;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class HashPass {
	public String getPass(String pass) throws NoSuchAlgorithmException {
		MessageDigest md = MessageDigest.getInstance("SHA-512");
		md.update(pass.getBytes());
		String hex = String.format("%0128x", new BigInteger(1, md.digest()));
		return hex;
	}
}