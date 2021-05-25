package com.company;

import java.util.concurrent.CountDownLatch;

public class TestNativeOutOfMemoryError {

    public static void main(String[] args) {

        for (int i = 0; ; i++) {
            try {
                new Thread(new HoldThread()).start();
            } catch (Error e) {
                System.out.println("i=" + i);
                throw e;
            }
        }
    }

}

class HoldThread extends Thread {
    CountDownLatch cdl = new CountDownLatch(1);


    public HoldThread() {
        this.setDaemon(true);
    }

    public void run() {
        try {
            cdl.await();
        } catch (InterruptedException e) {
        }
    }
}
