package cn.ebook.tools;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateCount {

    public int getDays(String datenoe,String datetwo) throws Exception {
        System.out.println(" /* String sEndDate = \"2018-03-01\";//*/");
       /* String sEndDate = "2018-03-01";//*/
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date1 = sdf.parse(datenoe);
        Date date2 = sdf.parse(datetwo);
        long days = (date2.getTime() - date1.getTime()) / (24 * 3600 * 1000);
        long yushu = (date2.getTime() - date1.getTime()) % (24 * 3600 * 1000);
        System.out.println("days:" + days + ",yushu:" + yushu);
        //规整方法1
       /* date1.setHours(0);
        date1.setMinutes(0);
        date1.setSeconds(0);
        long days2 = (date2.getTime() - date1.getTime()) / (24 * 3600 * 1000);
        long yushu2 = (date2.getTime() - date1.getTime()) % (24 * 3600 * 1000);
        System.out.println("days2:" + days2 + ",yushu2:" + yushu2);
        // 规整方法2
        String sdate1 = sdf.format(date1);
        date1 = sdf.parse(sdate1);
        long days3 = (date2.getTime() - date1.getTime()) / (24 * 3600 * 1000);
        long yushu3 = (date2.getTime() - date1.getTime()) % (24 * 3600 * 1000);
        System.out.println("days3:" + days3 + ",yushu3:" + yushu3);*/

        return (int) days;
    }

    public  Integer getAAA(){
        return  0;
    }

}
