package com.gyl.commons;

import org.springframework.stereotype.Component;

import java.util.UUID;

/**
 * 提供随机数
 */
@Component
public class UUIDString {
    public static String createId(){
        /**
         * f6a10594469c4b54991f3153e08c0548
         */
        String[] IDS = UUID.randomUUID().toString().split("-");
        StringBuilder sb = new StringBuilder(100);
        for (int i = 0; i < IDS.length; i++) {
            sb.append(IDS[i]);
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        String id = createId();
        System.out.println("id = " + id);
    }
}
