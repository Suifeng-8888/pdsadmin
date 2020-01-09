package com.hniois.controller.upload;

import com.hazelcast.core.IFunction;
import com.hniois.controller.base.BaseController;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/test")
public class testAction extends BaseController {

    /**
     * 文件上传
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/upload")
    @ResponseBody
    public String upload(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=utf-8");
        JSONObject r=JSONObject.fromObject("{'state':'error','message':'上传失败'}");
        //文件保存目录路径,获取文件觉得路径
        String savePath=request.getSession().getServletContext().getRealPath("/")+"attach/";
        //文件保存的url,获取的是webroot下的根路径
        String saveUrl=request.getContextPath()+"attach/";
        //检查上传的文件是否为空
        if(!ServletFileUpload.isMultipartContent(request)){
            r.put("message","请选择文件");
            return r.toString();
        }
        //检查文件目录
        File uploadDir=new File(savePath);
        if (!uploadDir.exists()){
            uploadDir.mkdirs();
        }
        //检查目录写的权限
        if(!uploadDir.canWrite()){
            r.put("message","没有写的权限");
            return r.toString();
        }
        //创建文件夹
         savePath += "file";
         saveUrl += "file";
         File fileDir=new File(savePath);
        if(!fileDir.exists()){
           fileDir.mkdirs();
        }
        String ymd=new SimpleDateFormat("yyyyMMssHHmmss").format(new Date());
        savePath+=ymd+"/";
        saveUrl+=ymd+"/";
        File Dir=new File(savePath);
        if(!Dir.exists()){
            Dir.mkdirs();
        }
        //使用Apache文件上传组件处理文件上传步骤：
        //1、创建一个DiskFileItemFactory工厂
        FileItemFactory factory=new DiskFileItemFactory();
        //2、创建一个文件上传解析器
        ServletFileUpload upload=new ServletFileUpload(factory);
        //解决上传文件名的中文乱码
        upload.setHeaderEncoding("utf-8");

        try{

            //从request请求中获取要上传的文件
            MultipartHttpServletRequest mulrequest= (MultipartHttpServletRequest) request;
             List<MultipartFile> fileList = mulrequest.getFiles("file");
           // List<FileItem> fileList = upload.parseRequest(request);
            String [] urls=new String[fileList.size()];
            String [] filenames=new String[fileList.size()];
            int i=0;
            for(MultipartFile item:fileList){
                if(!item.isEmpty()){
                    //最大文件大小 2M
                    long maxSize = 2097152;//1024*1024*2
                    if(item.getSize()>maxSize){
                        r.put("message","上传文件超过限制");
                        return r.toString();
                    }
                    //获取上传文件名
                    String filename=item.getOriginalFilename();
                    try{
                        File file=new File(savePath,filename);
                        item.transferTo(file);

                    }catch (Exception e){
                        r.put("message","上传文件失败");
                        return r.toString();
                    }

                    filenames[i]=filename;
                    urls[i++]=saveUrl+filename;
                }
            }

            r.put("state","ok");
            r.put("message","上传成功");
            r.put("url",urls);//全路径
            r.put("filename",filenames);//全路径
        }catch (Exception e){
            e.printStackTrace();
        }

        return r.toString();
    }


    /**
     * 文件下载
     * @param request
     * @param response
     * @param path
     */
    @RequestMapping("/down")
    @ResponseBody
    public void download(HttpServletRequest request,HttpServletResponse response,String path){
        //确定文件下载路径
        InputStream is=null;
        OutputStream os=null;
        try{
            // path是指欲下载的文件的路径。
            path=request.getSession().getServletContext().getRealPath("/")+path;
            File file=new File(path);
            //获取文件名
            String filename=file.getName();
            is=new BufferedInputStream(new FileInputStream(file));
            // 以流的形式下载文件。
            byte[] buff=new byte[is.available()];
            is.read(buff);
            //清空response
            response.reset();
            //设置下载头header
            response.setHeader("Content-Disposition","attachment;filename="+new String(filename.getBytes(),"utf-8"));
            response.setContentType("application/octet-stream");
            os=new BufferedOutputStream(response.getOutputStream());
            os.write(buff);
            os.flush();
        }catch (Exception e){

        }finally{
            try {
                os.close();
                is.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
