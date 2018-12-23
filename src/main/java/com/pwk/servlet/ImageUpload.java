package com.pwk.servlet;

import com.pwk.tools.Upload;
import org.apache.commons.lang.StringUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 14-2-16
 * Time: 下午5:19
 * To change this template use File | Settings | File Templates.
 */
public class ImageUpload extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String type = req.getParameter("type");
            SimpleDateFormat format = new SimpleDateFormat("yyyyMMdd");
            String path = "upload/"+ (StringUtils.isBlank(type)?"common":type)+"/" + format.format(new Date());
            Upload.uploadPics(req, resp, path,type);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        this.doPost(req,resp);
    }
}
