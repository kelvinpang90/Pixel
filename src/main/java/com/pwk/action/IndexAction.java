package com.pwk.action;

import com.pwk.action.base.BaseAction;
import com.pwk.tools.IndexThread;

/**
 * Created by Administrator on 2015/4/4.
 */
public class IndexAction extends BaseAction {

    public String sleep(){
//        IndexThread thread = new IndexThread();
//        thread.run();
        try {
            Thread.sleep(4000);
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return null;
    }
}
