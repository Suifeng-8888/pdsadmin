import com.hniois.util.DateUtil;
import com.hniois.util.StringUtil;
import org.junit.Test;

import static com.hniois.util.StringUtil.*;

public class testMon {


    @Test
    public void getMon(){
        String  s="ps2016sss77-545j";
        String str="0123456789";
        String result="";
        System.out.println(str.indexOf(s.substring(s.length()-1)));
        if(str.indexOf(s.substring(s.length()-1))!=-1){
            String regex="[^0-9]";
            String ss= s.replaceAll(regex,"@");
            String sss=ss.replaceAll("(@)\\1+", "$1");
            String [] arr=sss.split("@");
            String temp=arr[arr.length-1];
            String newtemp=String.valueOf(Integer.parseInt(temp)+1);
            result = s.substring(0, s.indexOf(temp))+newtemp;
        }
        System.out.println(result);
    }
}
