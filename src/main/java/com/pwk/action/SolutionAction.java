package com.pwk.action;

import com.pwk.action.base.BaseAction;
import com.pwk.entity.Solution;
import com.pwk.service.SolutionService;
import com.pwk.tools.Message;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.annotation.Resource;

/**
 * Created by wenkai.peng on 10/24/2014.
 */
public class SolutionAction extends BaseAction {

    private static final Logger LOG = LogManager.getLogger(SolutionAction.class.getName());

    @Resource
    private SolutionService solutionService;

    public String add(){
        try {
            String title = getRequest().getParameter("title");
            String description = getRequest().getParameter("description");
            String pic = getRequest().getParameter("pic");
            String type = getRequest().getParameter("type");
            Solution solution = new Solution();
            solution.setTitle(title);
            solution.setDescription(description);
            solution.setPic(pic);
            solution.setType(type);
            solution.setStatus("1");
            solutionService.add(solution);
            Message.returnMessage("方案添加成功！", "../../back/solution/solutionList.jsp", "ok", getResponse());
            LOG.info("增加解决方案成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public String delete(){
        try {
            String id = getRequest().getParameter("id");
            solutionService.delete(Integer.valueOf(id));
            getResponse().sendRedirect("../../back/solution/solutionList.jsp");
            LOG.info("删除解决方案成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }

    public String update(){
        try {
            String id = getRequest().getParameter("id");
            String title = getRequest().getParameter("title");
            String description = getRequest().getParameter("description");
            String pic = getRequest().getParameter("pic");
            String type = getRequest().getParameter("type");
            Solution solution = solutionService.getById(Integer.valueOf(id));
            solution.setTitle(title);
            solution.setDescription(description);
            solution.setPic(pic);
            solution.setType(type);
            solutionService.update(solution);
            Message.returnMessage("方案修改成功！", "../../back/solution/solutionList.jsp", "ok", getResponse());
            LOG.info("修改解决方案成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return null;
    }
}
