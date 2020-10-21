package com.company;

import java.io.*;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;

public class JvmAssignment2ClassLoader extends ClassLoader {
    public static void main(String[] args) throws IOException {
        JvmAssignment2ClassLoader classLoader = new JvmAssignment2ClassLoader();
        try {
            Object obj = classLoader.findClass("Hello").newInstance();
            Method method = obj.getClass().getMethod("hello");
            method.invoke(obj);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Override
    protected Class<?> findClass(String name) throws ClassNotFoundException {
        byte[] bytes = handle();
        if (bytes == null) {
            throw new ClassNotFoundException();
        }

        return defineClass(name, bytes, 0, bytes.length);
    }


    private byte[] handle() {
        try {
            byte[] oArray = getFileToByteArray("D:/project/JavaProjects/geektime-geekbang/JAVA-000/Week_01/task/Hello.xlass");
            for (int i = 0; oArray != null && i < oArray.length; i++) {
                oArray[i] = (byte) (255 - oArray[i]);
            }
            return oArray;
        } catch (IOException e) {
            e.printStackTrace();
        }
        return null;
    }


    private static byte[] getFileToByteArray(String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            throw new FileNotFoundException();
        }
        int size;
        if (file.length() > Integer.MAX_VALUE) {
            size = Integer.MAX_VALUE;
        } else {
            size = (int) file.length();
        }

        try (FileInputStream fileInputStream = new FileInputStream(file)) {
            byte[] bytes = new byte[size];
            if (fileInputStream.read(bytes) > 0) {
                return bytes;
            }
        }
        return null;
    }

}
