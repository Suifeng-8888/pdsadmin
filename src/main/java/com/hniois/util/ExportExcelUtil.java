package com.hniois.util;

import com.hniois.entity.demo.Demo;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFRichTextString;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.beans.PropertyDescriptor;
import java.io.IOException;
import java.io.OutputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Excel导出.
 */
public class ExportExcelUtil<T> {

	private String excelType = "";
	/**
	 * BaseController应用方法
	 * @param list
	 * 			要导出的数据
	 * @param out
	 *			response响应导出流
	 * */
	public void export(Collection<T> list,OutputStream out) throws Exception{
		//获取Session Demo导出配置
		Demo demo = SessionManager.getExcelDemo();
		//获取Excel版本
		excelType = demo.getCheck();
		//获取导出 head 信息
		List heads = demo.getData();
		//标题栏
		String[] head_text = new String[heads.size()];
		//标题栏 key
		String[] head_key = new String[heads.size()];
		//组装 head 数组
		for(int i=0;i<heads.size();i++){
			head_text[i] = ((Map)heads.get(i)).get("comment").toString();
			head_key[i] = ((Map)heads.get(i)).get("name").toString();
		}
		//执行通用方法
		exportExcel(list,head_text,head_key,out);
	}

	/**
	 * 通用方法: 利用了JAVA的反射机制，可以将放置在JAVA集合中并且符合一定条件的数据
	 * 			以EXCEL 的形式输出到指定IO设备上
	 * @param dataset
	 *            需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
	 *            javabean属性的数据类型有基本数据类型及String,Date,byte[](图片数据)
	 * @param headerTitle
	 *            表格属性列名数组（标题）若为null，默认显示headers
	 * @param headers
	 *            表格属性列名数组
	 * @param out
	 *            与输出设备关联的流对象，可以将EXCEL文档导出到本地文件或者网络中
	 */
	public void exportExcel(Collection<T> dataset,String[] headerTitle, String[] headers,OutputStream out) throws Exception{
		// 声明一个工作薄
		Workbook workbook = isExcel2003()?new HSSFWorkbook():new XSSFWorkbook();
		//生成标题样式
		CellStyle headStyle = getHeadStyle(workbook);
		//生成Cell样式
		CellStyle cellStyle = getCellStyle(workbook);

		//Sheet分页: 2000
		int sheetCount = 2000;
		//是否分页
		if (dataset.size() > sheetCount) {
			Iterator<T> it = dataset.iterator();
			//默认设置导出 2W 条数据上限 大数据重写导出方法
			for (int i = 0; i < 10; i++) {
				int index = 0;
				List<T> list = new ArrayList<T>();
				while (it.hasNext()) {
					index++;
					if (index < sheetCount) {
						list.add(it.next());
					} else {
						break;
					}
				}
				//创建Sheet页
				createSheet(list, headerTitle, headers,"Sheet_" + (i + 1), workbook, headStyle, cellStyle);
			}
		} else {
			//创建Sheet页
			createSheet(dataset, headerTitle, headers, "Sheet", workbook, headStyle, cellStyle);
		}

		try {
			workbook.write(out);
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			//关闭流
			try {
				out.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	/**
	 * 底层方法: 利用了JAVA的反射机制，可以将放置在JAVA集合中并且符合一定条件的数据
	 * 			以EXCEL 的形式输出到指定IO设备上
	 *
	 * @param headerTitle
	 *            表格属性列名数组（标题）若为null，默认显示headers
	 * @param headers
	 *            表格属性列名数组
	 * @param dataset
	 *            需要显示的数据集合,集合中一定要放置符合javabean风格的类的对象。此方法支持的
	 *            javabean属性的数据类型有基本数据类型及String,Date,byte[](图片数据)
	 * @param workbook
	 *            Excel对象
	 * @param style
	 *            标题栏 Style
	 * @param style2
	 *            单元格 Style
	 * */
	public void createSheet(Collection<T> dataset,String[] headerTitle, String[] headers, String title,
							  Workbook workbook,CellStyle style, CellStyle style2) throws Exception {
		// 生成一个表格
		Sheet sheet = workbook.createSheet(title);
		// 设置表格默认列宽度为15个字节
		sheet.setDefaultColumnWidth((short) 15);
		// 产生表格标题行
		Row row = sheet.createRow(0);
		String[] showTitle = headers;
		if (headerTitle != null){
			showTitle = headerTitle;
		}
		int indexTitle = 0;// excel列下标
		for (short i = 0; i < showTitle.length; i++) {
			if (StringUtils.isEmpty(showTitle[i]))
				continue;
			Cell cell = row.createCell((short) indexTitle);
			cell.setCellStyle(style);
			RichTextString text = isExcel2003()?new HSSFRichTextString(showTitle[i]):new XSSFRichTextString(showTitle[i]);
			cell.setCellValue(text);
			indexTitle++;
		}
		if (dataset == null || dataset.isEmpty())
			return;
		// 遍历集合数据，产生数据行
		Iterator<T> it = dataset.iterator();
		int index = 0;
		while (it.hasNext()) {
			index++;
			row = sheet.createRow(index);
			T t = (T) it.next();
			Class tCls = t.getClass();
			Method[] methods = t.getClass().getMethods();
			// 利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
			Field[] fields = new Field[headers.length];

			for (short j = 0; j < headers.length; j++) {
				if (StringUtils.isEmpty(headers[j]))
					continue;
				Field field1 = tCls.getDeclaredField(headers[j]);
				fields[j] = field1;
			}
			int indexText = 0;// excel列下标
			Field field = null;
			for (short i = 0; i < fields.length; i++) {
				if (fields[i] == null) continue;

				field = fields[i];
				Cell cell = row.createCell((short) indexText);
				cell.setCellStyle(style2);

				String fieldName = field.getName();
				PropertyDescriptor pd = new PropertyDescriptor(fieldName, tCls);
				Method getMethod = pd.getReadMethod();
				Object value = getMethod.invoke(t, new Object[] {});
				// 判断值的类型后进行强制类型转换
				String textValue = null;
				if (value instanceof Boolean) {
					boolean bValue = (Boolean) value;
					textValue = "是";
					if (!bValue)
						textValue = "否";
				} else if (value instanceof Date) {
					Date date = (Date) value;
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					textValue = sdf.format(date);
				} else {
					// 其它数据类型都当作字符串简单处理
					if (value == null)
						value = "";

					textValue = value.toString();
				}

				//利用正则表达式判断textValue是否全部由数字组成
				if (textValue != null) {
					Pattern p = Pattern.compile("^//d+(//.//d+)?{1}quot;");
					Matcher matcher = p.matcher(textValue);
					if (matcher.matches()) {
						// 是数字当作double处理
						cell.setCellValue(Double.parseDouble(textValue));
					} else {
						RichTextString richString = isExcel2003()?new HSSFRichTextString(textValue):new XSSFRichTextString(textValue);
						Font font3 = workbook.createFont();
						font3.setColor(HSSFColor.BLACK.index);
						richString.applyFont(font3);
						cell.setCellValue(richString);
					}
				}
				indexText++;
			}
		}
	}

	/**
	 * 获取Head单元格样式
	 * @return CellStyle
	 */
	public CellStyle getHeadStyle(Workbook workbook){
		// 生成一个样式
		CellStyle style = workbook.createCellStyle();
		// 设置这些样式
		style.setFillForegroundColor(HSSFColor.WHITE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(CellStyle.BORDER_THIN);
		style.setBorderLeft(CellStyle.BORDER_THIN);
		style.setBorderRight(CellStyle.BORDER_THIN);
		style.setBorderTop(CellStyle.BORDER_THIN);
		style.setAlignment(CellStyle.ALIGN_CENTER);

		// 生成字体
		Font font = workbook.createFont();
		font.setColor(HSSFColor.BLACK.index);
		font.setFontHeightInPoints((short) 12);
		font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		// 把字体应用到当前的样式
		style.setFont(font);

		return style;
	}

	/**
	 * 获取Cell单元格样式
	 * @return CellStyle
	 */
	public CellStyle getCellStyle(Workbook workbook){
		CellStyle style = workbook.createCellStyle();
		// 设置这些样式
		style.setFillForegroundColor(HSSFColor.WHITE.index);
		style.setFillPattern(CellStyle.SOLID_FOREGROUND);
		style.setBorderBottom(CellStyle.BORDER_THIN);
		style.setBorderLeft(CellStyle.BORDER_THIN);
		style.setBorderRight(CellStyle.BORDER_THIN);
		style.setBorderTop(CellStyle.BORDER_THIN);
		style.setAlignment(CellStyle.ALIGN_CENTER);
		style.setVerticalAlignment(CellStyle.VERTICAL_CENTER);

		// 生成字体
		Font font2 = workbook.createFont();
		font2.setBoldweight(Font.BOLDWEIGHT_NORMAL);
		style.setFont(font2);

		return style;
	}

	/**
	 * 判断Excel版本
	 * @return Boolean  true[2003] / false[2007]
	 * */
	public boolean isExcel2003(){
		//懒加载 :获取Excel版本
		if(StringUtils.isEmpty(excelType)){
			excelType = SessionManager.getExcelDemo().getCheck();
		}
		return excelType.equals("2003")?true:false;
	}
}
