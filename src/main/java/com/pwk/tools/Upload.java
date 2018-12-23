package com.pwk.tools;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Administrator on 14-1-13.
 */
public class Upload {

    private static final Logger LOG = LogManager.getLogger(Upload.class.getName());

    /**
     *
     * @param request
     * @param response
     * @param path
     * @param type
     * @return
     */
    public static String uploadPics(HttpServletRequest request, HttpServletResponse response, String path, String type) {
        try {
            PrintWriter out = response.getWriter();
            if (ServletFileUpload.isMultipartContent(request)) {
                String uploadPath = request.getSession().getServletContext().getRealPath("/") + path;
                String tempPath = request.getSession().getServletContext().getRealPath("/") + "upload/temp";
                File uploadFile = new File(uploadPath);
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }
                File tempPathFile = new File(tempPath);
                if (!tempPathFile.exists()) {
                    tempPathFile.mkdirs();
                }
                DiskFileItemFactory factory = new DiskFileItemFactory();
                factory.setSizeThreshold(4096); // 设置缓冲区大小，这里是4kb
                factory.setRepository(tempPathFile);// 设置缓冲区目录

                ServletFileUpload upload = new ServletFileUpload(factory);
                upload.setSizeMax(10485760); // 设置最大文件尺寸，这里是10MB

                List<FileItem> items = upload.parseRequest(request);// 得到所有的文件
                Iterator<FileItem> i = items.iterator();
                StringBuilder picPath = new StringBuilder();
                while (i.hasNext()) {
                    FileItem fi = i.next();
                    String fileName = fi.getName();
                    String prefix = StringTools.getFileType(fileName);
                    if (fileName != null) {
                        File fullFile = new File(fi.getName());
                        File savedFile = new File(uploadPath, fullFile.getName());
                        fi.write(savedFile);
                        File newFile = new File(uploadPath, String.valueOf(System.currentTimeMillis()) + "." + prefix);
                        boolean flag = savedFile.renameTo(newFile);
                        if (!flag)
                            System.err.println("图片修改名字失败！");

                        if(StringUtils.equals(type,"weddingIcon")){
                            picPath.append(path + "/" + newFile.getName() + "###");
                        }else if(StringUtils.equals(type,"icon")){
                            picPath = new StringBuilder(path + "/" + newFile.getName());
                        }else{
                            //生成压缩图片
                            String compressPic = CompressPic.compress(newFile, type);
                            picPath.append(path + "/" + compressPic+"###");
                        }
                    }
                }
                LOG.info("图片上传成功！ "+picPath);
                String callback = request.getParameter("CKEditorFuncNum");
                if(StringUtils.isNotBlank(callback)){
                    out.println("<script type='text/javascript'>");
                    out.println("window.parent.CKEDITOR.tools.callFunction("+ callback + ",'/"+ picPath + "','')");
                    out.println("</script>");
                }else{
                    out.print(picPath.toString());
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }


}
