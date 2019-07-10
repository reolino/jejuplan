package com.example.jejuplan;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class EncryptTest {
	public static void main(String[] args) {
        StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
        pbeEnc.setAlgorithm("PBEWithMD5AndDES");
        pbeEnc.setPassword("jejuplan");

        String url = "jdbc:log4jdbc:mysql://localhost:3306/jeju_db?serverTimezone=UTC";
        String username = "root";
        String password = "a123123!";

        System.out.println("기존  URL :: " + url + " | 변경 URL :: " + pbeEnc.encrypt(url));
        System.out.println("기존  username :: " + username + " | 변경 username :: " + pbeEnc.encrypt(username));
        System.out.println("기존  password :: " + password + " | 변경 password :: " + pbeEnc.encrypt(password));
    }

}
