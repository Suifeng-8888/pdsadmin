import com.hniois.util.ExportWordUtil;

import java.io.*;
import java.util.HashMap;
import java.util.Map;

public class TestW1 {

    public static void main(String[] args){
        Map<String, String>param =new HashMap<String, String>();

        param.put("${报告编号}","1234");
        param.put("${样品名称}","名称");
        param.put("${送检单位}","单位");
        param.put("${检验类别}","种类");
        param.put("${样品名称}","1234");
        param.put("${样品编号}","1234");
        param.put("${受检单位}","1111");
        param.put("${检验类别}","2222");
        param.put("${生产单位}","3333");
        param.put("${样品状态}","4444");
        param.put("${抽样地点}","5555");
        param.put("${抽样日期}","6161");
        param.put("${样品数量}","7777");
        param.put("${抽样基数}","8888");
        param.put("${实验室条件}","9999");
        param.put("${检验日期}","1212");
        param.put("${仪器名称}","1213");
        param.put("${仪器型号}","1214");
        param.put("${仪器编号}","1215");
        param.put("${检验依据}","1616");
        param.put("${判定依据}","1717");
        param.put("${检验结论}","1818");
        param.put("${备注}","1919");
        param.put("${项目1}","2121");
        param.put("${要求1}","2121");
        param.put("${结果1}","2121");
        param.put("${限值1}","2121");
        param.put("${结论1}","2121");
        param.put("${项目2}","2222");
        param.put("${要求2}","2222");
        param.put("${结果2}","2222");
        param.put("${限值2}","2222");
        param.put("${结论2}","2222");
        param.put("${项目3}","3333");
        param.put("${要求3}","3333");
        param.put("${结果3}","3333");
        param.put("${限值3}","3333");
        param.put("${结论3}","3333");
        param.put("${项目4}","4444");
        param.put("${要求4}","4444");
        param.put("${结果4}","4444");
        param.put("${限值4}","4444");
        param.put("${结论4}","4444");
        param.put("${项目5}","5555");
        param.put("${要求5}","5555");
        param.put("${结果5}","5555");
        param.put("${限值5}","5555");
        param.put("${结论5}","5555");
        param.put("${项目6}","6666");
        param.put("${要求6}","6666");
        param.put("${结果6}","6666");
        param.put("${限值6}","6666");
        param.put("${结论6}","6666");
        param.put("${项目7}","7777");
        param.put("${要求7}","7777");
        param.put("${结果7}","7777");
        param.put("${限值7}","7777");
        param.put("${结论7}","7777");
        param.put("${项目8}","8888");
        param.put("${要求8}","8888");
        param.put("${结果8}","8888");
        param.put("${限值8}","8888");
        param.put("${结论8}","8888");
        param.put("${项目9}","9999");
        param.put("${要求9}","9999");
        param.put("${结果9}","9999");
        param.put("${限值9}","9999");
        param.put("${结论9}","9999");
        param.put("${项目10}","0000");
        param.put("${要求10}","0000");
        param.put("${结果10}","0000");
        param.put("${限值10}","0000");
        param.put("${结论10}","0000");
        param.put("${项目11}","1111");
        param.put("${要求11}","1111");
        param.put("${结果11}","1111");
        param.put("${限值11}","1111");
        param.put("${结论11}","1111");
        param.put("${项目12}","1212");
        param.put("${要求12}","1212");
        param.put("${结果12}","1212");
        param.put("${限值12}","1212");
        param.put("${结论12}","1212");
        param.put("${项目13}","3131");
        param.put("${要求13}","3131");
        param.put("${结果13}","3131");
        param.put("${限值13}","3131");
        param.put("${结论13}","3131");
        param.put("${项目14}","4141");
        param.put("${要求14}","4141");
        param.put("${结果14}","4141");
        param.put("${限值14}","4141");
        param.put("${结论14}","4141");
        param.put("${项目15}","5151");
        param.put("${要求15}","5151");
        param.put("${结果15}","5151");
        param.put("${限值15}","5151");
        param.put("${结论15}","5151");
        param.put("${项目16}","6161");
        param.put("${要求16}","6161");
        param.put("${结果16}","6161");
        param.put("${限值16}","6161");
        param.put("${结论16}","6161");
        param.put("${项目17","7171");
        param.put("${要求17}","7171");
        param.put("${结果17}","7171");
        param.put("${限值17}","7171");
        param.put("${结论17}","7171");
        param.put("${项目18}","8181");
        param.put("${要求18}","8181");
        param.put("${结果18}","8181");
        param.put("${限值18}","8181");
        param.put("${结论18}","8181");
        param.put("${项目19}","9191");
        param.put("${要求19}","9191");
        param.put("${结果19}","9191");
        param.put("${限值19}","9191");
        param.put("${结论19}","9191");
        param.put("${项目20}","2020");
        param.put("${要求20}","2020");
        param.put("${结果20}","2020");
        param.put("${限值20}","2020");
        param.put("${结论20}","2020");
        param.put("${项目21}","2121");
        param.put("${要求21}","2121");
        param.put("${结果21}","2121");
        param.put("${限值21}","2121");
        param.put("${结论21}","2121");

        try {
            OutputStream out=new FileOutputStream(new File("d://temp//test1.doc"));
            ExportWordUtil.exportWord("d://test1.doc", out , param);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }



    }





}
