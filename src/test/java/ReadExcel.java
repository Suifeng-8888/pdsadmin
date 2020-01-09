import com.hniois.util.ReadExcelUtil;
import org.junit.Test;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Map;

public class ReadExcel {

    InputStream is;
    @Test
    public void test(){
        {
            try {
                is = new FileInputStream("f:\\test.xls");
//                is = new FileInputStream("d:\\poi.xls");
                ReadExcelUtil readExcelUtil = new ReadExcelUtil();
                Map<Integer, String> map = readExcelUtil.readExcelContent(is);
                int i=0;
                for(String v:map.values()){
                    System.out.println("第 "+i+" 行内容为 "+v);
                    i++;
                }
            } catch (FileNotFoundException e) {
                System.out.println("未找到指定路径的文件!");
                e.printStackTrace();
            }
        }
    }

}
