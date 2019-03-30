package com.gyl;


import java.util.Enumeration;
import java.net.Inet4Address;
import java.net.NetworkInterface;
import java.net.InetAddress;

public class DateTest {
    public static void main(String[] args) {
        Enumeration allNetInterfaces = null;
        try {
            allNetInterfaces = NetworkInterface.getNetworkInterfaces();
        } catch (java.net.SocketException e) {
            e.printStackTrace();
        }
        InetAddress ip = null;
        while (allNetInterfaces.hasMoreElements()) {
            NetworkInterface netInterface = (NetworkInterface) allNetInterfaces
                    .nextElement();
            System.out.println(netInterface.getName());
            Enumeration addresses = netInterface.getInetAddresses();
            while (addresses.hasMoreElements()) {
                ip = (InetAddress) addresses.nextElement();
                if (ip != null && ip instanceof Inet4Address) {
                    if (ip.getHostAddress().equals("127.0.0.1")) {
                        continue;
                    }
                    System.out.println("/u672c/u673a/u7684IP = " + ip.getHostAddress());
                    return;
                }
            }
        }
        System.out.println("网络无连接！");
    }
}