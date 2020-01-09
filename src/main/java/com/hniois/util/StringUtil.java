package com.hniois.util;
/**
 * 字符串相关方法
 *
 */
public class StringUtil {

	/**
	 * 将以逗号分隔的字符串转换成字符串数组
	 * @param valStr
	 * @return String[]
	 */
	public static String[] StrList(String valStr){
		int i = 0;
		String TempStr = valStr;
		String[] returnStr = new String[valStr.length() + 1 - TempStr.replace(",", "").length()];
		valStr = valStr + ",";
		while (valStr.indexOf(',') > 0)
		{
			returnStr[i] = valStr.substring(0, valStr.indexOf(','));
			valStr = valStr.substring(valStr.indexOf(',')+1 , valStr.length());

			i++;
		}
		return returnStr;
	}

	/**获取字符串编码
	 * @param str
	 * @return
	 */
	public static String getEncoding(String str) {
		String encode = "GB2312";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s = encode;
				return s;
			}
		} catch (Exception exception) {
		}
		encode = "ISO-8859-1";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s1 = encode;
				return s1;
			}
		} catch (Exception exception1) {
		}
		encode = "UTF-8";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s2 = encode;
				return s2;
			}
		} catch (Exception exception2) {
		}
		encode = "GBK";
		try {
			if (str.equals(new String(str.getBytes(encode), encode))) {
				String s3 = encode;
				return s3;
			}
		} catch (Exception exception3) {
		}
		return "";
	}

	//根据字符串获取数字元素之和
	public static String StringSum(String ss){
		String[] arr=ss.split(",");
		int sum=0;
		for(String s:arr){
			sum+=Integer.parseInt(s);
		}
		return String.valueOf(sum);
	}

	//根据字符串获取数字元素之积
	public static String StringSum2(String ss,String num){
		String[] arr=ss.split(",");
		String[] nums=num.split(",");
		int sum=0;
		for(int i=0;i<arr.length;i++){
			sum+=Integer.parseInt(arr[i])*Integer.parseInt(nums[i]);
		}
		return String.valueOf(sum);
	}

	//获取的字符串如果是以数字结尾,则数字加1产生新的字符串
	public static String getNewString(String s){

		String str="0123456789";
		String result="";
		//判断最后一位是否是数字
		if(str.indexOf(s.substring(s.length()-1))!=-1){
			String regex="[^0-9]";
			String ss= s.replaceAll(regex,"@");
			String sss=ss.replaceAll("(@)\\1+", "$1");
			String [] arr=sss.split("@");
			String temp=arr[arr.length-1];
			String newtemp=String.valueOf(Integer.parseInt(temp)+1);
			result = s.substring(0, s.indexOf(temp))+newtemp;
		}
		return result;
	}
}
