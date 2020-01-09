package com.hniois.controller.purchase;


import com.alibaba.fastjson.JSON;
import com.hniois.common.page.Page;
import com.hniois.controller.base.BaseController;
import com.hniois.entity.purchase.Product;

import com.hniois.service.purchase.product.ProductManage;

import com.hniois.util.DateUtil;
import com.hniois.util.FileUtil;
import com.hniois.util.ReadExcelUtil;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.lang.StringUtils;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.*;

@Controller
@RequestMapping(value="/product")
public class ProductAction extends BaseController{
    //用户
    @Resource(name="productService")
    private ProductManage productService;

    private String product_list = "purchase/product/product_list";
    private String product_edit = "purchase/product/product_edit";

    @RequestMapping(value="/toPage")
    public ModelAndView toPage(Page e){
        ModelAndView mv = getModelAndViewToPage(e);
        mv.setViewName(product_list);
        return mv;
    }

    /**
     * 分页查询
     * @param e
     * @return json
     * */
    @RequestMapping(value = "/list")
    @ResponseBody
    public String list(Product e) throws Exception{
        // 当前页
        int currPage = getThisPage(e.getPage());
        // 每页显示条数
        int limit = getThisLimit(e.getLimit());

        e.setOffset((currPage-1)*limit);
        e.setPageSize(limit);
        Page page = productService.findPage(e);
        return JSON.toJSONString(page);
    }

    /**
     * 查询List
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findList")
    @ResponseBody
    public String findList(Product e) throws Exception {
        List<Product> list = productService.findList(e);
        JSONArray arr = JSONArray.fromObject(list);
        return arr.toString();
    }

    /**
     * 查询count
     * @param e
     * @return json
     * */
    @RequestMapping(value="/findCount")
    @ResponseBody
    public String findCount(Product e) throws Exception {
        Integer count = productService.findCount(e);
        return String.valueOf(count);
    }

    /**
     * 查询
     * @param e
     * @return json
     * */
    @RequestMapping(value="/find")
    @ResponseBody
    public String find(Product e) throws Exception {
        Product m = productService.find(e);
        JSONObject obj = JSONObject.fromObject(m);
        return obj.toString();
    }


    /**
     * 新增 or 保存页面
     */
    @RequestMapping(value="/toEdit")
    public ModelAndView toAorU(Product e) throws Exception{
        ModelAndView mv = this.getModelAndView();
        Product product = new Product();
        if(StringUtils.isNotEmpty(e.getId())){
            product = productService.find(e);
        }
        product.setCode(e.getCode());//判断：0查询 or 1 增加/修改
        mv.addObject("product",product);
        mv.setViewName(product_edit);
        return mv;
    }

    /**
     * 保存
     * @param e
     * @return json
     * */
    @RequestMapping(value="/add")
    @ResponseBody
    public String add(Product e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        Product p = new Product();
        p.setPro_id(e.getPro_id());
        //条件判断
        if(productService.findCount(p)>0){
            setMsg(obj,"error","数据已存在!");
        }else{
            productService.save(e);
        }
        return obj.toString();
    }

    /**
     * 修改
     * @param e
     * @return json
     * */
    @RequestMapping(value="/update")
    @ResponseBody
    public String update(Product e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        //条件判断
        if(e.getId()!=null){
            productService.update(e);
        }else{
            setMsg(obj,"error","操作失败!");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return json
     * */
    @RequestMapping(value="/delete")
    @ResponseBody
    public String delete(Product e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e.getId()!=null){
            productService.delete(e);
        }else {
            setMsg(obj,"error","删除失败!");
        }
        return obj.toString();
    }

    /**
     * 删除
     * @param e
     * @return json
     * */
    @RequestMapping(value="/deletes")
    @ResponseBody
    public String deletes(Product e) throws Exception {
        JSONObject obj = getMsg();//返回信息
        if(e.getData()!=null){
            productService.deleteBatch(e);
        }else {
            setMsg(obj,"error","删除失败!");
        }
        return obj.toString();
    }

    /**
     * 批量新增导入文件
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/upload")
    @ResponseBody
    public String batchAdd(HttpServletRequest request,HttpServletResponse response) throws Exception {
        JSONObject r=JSONObject.fromObject("{'state':'error','message':'保存失败'}");
        String path=request.getSession().getServletContext().getRealPath("/");
        String filepath=path+"temp";
        File dirFile=new File(filepath);
        //检查目录是否存在
        if(!dirFile.exists()){
            dirFile.mkdirs();
        }
        //检查目录权限
        if(!dirFile.canWrite()){
            r.put("message","上传目录没有写权限。");
            return r.toString();
        }
        //检查是否是表单提交的文件
        if(!ServletFileUpload.isMultipartContent(request)){
            r.put("message","请选择文件");
            return r.toString();
        }
        //使用Apache文件上传组件处理文件上传步骤：
        //1、创建一个DiskFileItemFactory工厂
        FileItemFactory factory=new DiskFileItemFactory();
        //2 创建一个文件上传解析器
        ServletFileUpload upload=new ServletFileUpload(factory);
        //3 解决上传文件名的中文乱码
        upload.setHeaderEncoding("utf-8");
        //4 开始上传文件的操作
        MultipartHttpServletRequest multipartRequest= (MultipartHttpServletRequest) request;
        //5 获取上传文件的集合
        List<MultipartFile> items = multipartRequest.getFiles("file");
        //集合里面就只上传了一个文件
        for(MultipartFile item:items){
            if(!item.isEmpty()){
                //最大文件大小
                long maxSize = 2097152;//1024*1024*2
                if(item.getSize()>maxSize){
                    r.put("message","文件大小超过限制");
                    return r.toString();
                }
                //获取文件名
                String filename=item.getOriginalFilename();
                File file=null;
                InputStream in=null;
                try {
                    file=new File(filepath,filename);
                    item.transferTo(file);
                    in=new FileInputStream(file);
                } catch (IOException e) {
                    e.printStackTrace();
                    r.put("message","文件上传失败");
                    return r.toString();
                }
                //文件上传成功后读取文件内容
               ReadExcelUtil rdExcel=new ReadExcelUtil();
                Map<Integer, String> map = rdExcel.readExcelContent(in);
                List<Product> list=new ArrayList<Product>();
                for(String v:map.values()){
                    Product p=new Product();
                    String [] arr=v.split("_");
                    p.setPro_id(arr[0]);
                    p.setPro_name(arr[1]);
                    p.setBar_code(arr[2]);
                    p.setPro_unit(arr[3]);
                    p.setStatement(arr[4]);
                    p.setBz(arr[5]);
                    list.add(p);
                }
                //批量新增
                productService.saveBatch(list);

            }
        }
        FileUtil.deleteDirectory(filepath);
        r.put("state","ok");
        r.put("message","上传成功");
        return r.toString();
    }
}
