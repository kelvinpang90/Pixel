package com.pwk.tools;

/**
 * Created by Administrator on 2015/4/4.
 */
public class IndexThread implements Runnable {
    @Override
    public void run() {
        try {
            Thread.sleep(5000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
    }
}
