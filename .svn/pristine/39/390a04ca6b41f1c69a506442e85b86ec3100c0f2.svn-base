package com.hniois.util;

import org.apache.poi.POIXMLDocument;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.usermodel.Range;
import org.apache.poi.xwpf.usermodel.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

/**
 * word导出.
 */
public class ExportWordUtil {
    /**
     * 替换Word文档内容
     * @param wordPath 模版文件地址
     * @param out 输出流
     * @param map 替换内容
     * */
    public static void exportWord(String wordPath, OutputStream out,Map<String, String> map) {
        try {
            if(wordPath.endsWith(".docx")){
                //2007 Word文档
                XWPFDocument xdt = new XWPFDocument(POIXMLDocument.openPackage(wordPath));
                repalceText(xdt,map);
                xdt.write(out);

            }else{
                //2003 Word文档
                File demoFile = new File(wordPath);
                FileInputStream in = new FileInputStream(demoFile);
                HWPFDocument hdt = new HWPFDocument(in);
                repalceText(hdt,map);
                hdt.write(out);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            //关闭输出流
            try {
                out.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 通用方法:2003Word替换文档
     * @param hdt 2003Word Document对象
     * @param map 替换内容
     */
    public static HWPFDocument repalceText(HWPFDocument hdt,Map<String, String> map) throws Exception{
       //读取文本内容
        Range range = hdt.getRange();
        //替换内容
        for (Map.Entry<String, String> entry : map.entrySet()) {
            range.replaceText(entry.getKey(), entry.getValue());
        }
        return hdt;
    }



    /**
     * 通用方法:2007Word替换文档
     * @param xdt 2007Word Document对象
     * @param map 替换内容
     */
    public static XWPFDocument repalceText(XWPFDocument xdt,Map<String, String> map) {
        try {
            if (map != null && map.size() > 0) {
                //处理段落
                List<XWPFParagraph> paragraphList = xdt.getParagraphs();
                processParagraphs(paragraphList, map);

                //处理表格
                Iterator<XWPFTable> it = xdt.getTablesIterator();
                while (it.hasNext()) {
                    XWPFTable table = it.next();
                    List<XWPFTableRow> rows = table.getRows();
                    for (XWPFTableRow row : rows) {
                        List<XWPFTableCell> cells = row.getTableCells();
                        for (XWPFTableCell cell : cells) {
                            List<XWPFParagraph> paragraphListTable =  cell.getParagraphs();
                            processParagraphs(paragraphListTable, map);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return xdt;
    }

    /**
     * 处理段落
     */
    public static void processParagraphs(List<XWPFParagraph> paragraphList,Map<String,String> map){
        if(paragraphList != null && paragraphList.size() > 0){
            for(XWPFParagraph paragraph:paragraphList){
                List<XWPFRun> runs = paragraph.getRuns();
                for (XWPFRun run : runs) {
                    String text = run.getText(0);
                    if(text != null){
                        boolean isSetText = false;
                        for (Map.Entry<String, String> entry : map.entrySet()) {
                            String key = entry.getKey();
                            if(text.indexOf(key) != -1){
                                isSetText = true;
                                text = text.replace(key, entry.getValue());
                            }
                        }
                        if(isSetText){
                            run.setText(text,0);
                        }
                    }
                }
            }
        }
    }

    public static XWPFDocument repalceText2(XWPFDocument xdt,Map<String, String> map) throws Exception{
        /**
         * 替换段落中的指定文字
         */
        Iterator<XWPFParagraph> itPara = xdt.getParagraphsIterator();
        while (itPara.hasNext()) {
            XWPFParagraph paragraph = (XWPFParagraph) itPara.next();
            Set<String> set = map.keySet();
            Iterator<String> iterator = set.iterator();
            while (iterator.hasNext()) {
                String key = iterator.next();
                List<XWPFRun> run=paragraph.getRuns();
                for(int i=0;i<run.size();i++)
                {
                    if(run.get(i).getText(run.get(i).getTextPosition())!=null &&
                            run.get(i).getText(run.get(i).getTextPosition()).equals(key))
                    {
                        /**
                         * 参数0表示生成的文字是要从哪一个地方开始放置,设置文字从位置0开始
                         * 就可以把原来的文字全部替换掉了
                         */
                        run.get(i).setText(map.get(key),0);
                    }
                }
            }
        }

        /**
         * 替换表格中的指定文字
         */
        Iterator<XWPFTable> itTable = xdt.getTablesIterator();
        while (itTable.hasNext()) {
            XWPFTable table = (XWPFTable) itTable.next();
            int count = table.getNumberOfRows();
            for (int i = 0; i < count; i++) {
                XWPFTableRow row = table.getRow(i);
                List<XWPFTableCell> cells = row.getTableCells();
                for (XWPFTableCell cell : cells) {
                    for (Map.Entry<String, String> e : map.entrySet()) {
                        if (cell.getText().equals(e.getKey())) {
                            cell.removeParagraph(0);
                            cell.setText(e.getValue());
                        }
                    }
                }
            }
        }

        return xdt;
    }


}
