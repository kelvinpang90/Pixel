package com.pwk.action;

import com.pwk.action.base.BaseAction;
import com.pwk.entity.Case;
import com.pwk.service.CaseService;
import com.pwk.tools.Message;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Resource;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by wenkai.peng on 10/23/2014.
 */
public class CaseAction extends BaseAction {

    @Resource
    private CaseService caseService;

    private static final Logger LOG = LogManager.getLogger(SolutionAction.class.getName());
    
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public String add(){
        try {
            String title = getRequest().getParameter("title");
            String pic = getRequest().getParameter("pic");
            String description = getRequest().getParameter("description");
            String type = getRequest().getParameter("type");
            String video = getRequest().getParameter("video");
            Case cases = new Case();
            cases.setTitle(title);
            cases.setPic(pic);
            cases.setDescription(description);
            cases.setCreateDate(Timestamp.valueOf(format.format(new Date())));
            cases.setType(type);
            cases.setVideo(video);
            cases.setStatus("1");
            caseService.add(cases);
            Message.returnMessage("增加案例成功","../../back/cases/caseList.jsp","ok",getResponse());
            LOG.info("增加案例成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public String delete(){
        try {
            String id = getRequest().getParameter("id");
            caseService.delete(Integer.valueOf(id));
            getResponse().sendRedirect("../../back/cases/caseList.jsp");
            LOG.info("删除案例成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public String update(){
        try {
            String id = getRequest().getParameter("id");
            String title = getRequest().getParameter("title");
            String pic = getRequest().getParameter("pic");
            String description = getRequest().getParameter("description");
            String type = getRequest().getParameter("type");
            String video = getRequest().getParameter("video");
            Case cases = caseService.getById(Integer.valueOf(id));
            cases.setTitle(title);
            cases.setPic(pic);
            cases.setType(type);
            cases.setDescription(description);
            cases.setVideo(video);
            caseService.update(cases);
            Message.returnMessage("修改案例成功","../../back/cases/caseList.jsp","ok",getResponse());
            LOG.info("修改案例成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
