import com.hniois.util.ExportWordUtil;
import org.junit.Test;

import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.Map;

/**
 * 测试类
 *
 * */
public class TestAction {

    @Test
    public void testPoiWordWrite2003() throws Exception{
        Map<String, String> map = new HashMap<String, String>();
        map.put("${ypmc}", "样品名称123");
        String srcPath = "G:\\test.doc";
        String destPath = "G:\\2.doc";
        FileOutputStream outStream = null;
        outStream = new FileOutputStream(destPath);
        ExportWordUtil.exportWord(srcPath, outStream, map);
    }

    @Test
    public void testPoiWordWrite2007() throws Exception{
        Map<String, String> map = new HashMap<String, String>();
        map.put("${ypmc}", "样品名称123");
        String srcPath = "G:\\test.docx";
        String destPath = "G:\\2.docx";
        FileOutputStream outStream = null;
        outStream = new FileOutputStream(destPath);
        ExportWordUtil.exportWord(srcPath, outStream, map);
    }

}
