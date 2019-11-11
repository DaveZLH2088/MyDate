package cn.air.controller;

import cn.air.pojo.Air_quality_index;
import cn.air.service.AirqualityService;
import cn.air.tools.Constants;
import cn.air.tools.PageSupport;
import com.alibaba.fastjson.JSONArray;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping(value = "/airquality")
public class AirqualityController {

    private Logger logger = Logger.getLogger(BookController.class);
    @Resource private AirqualityService airqualityService;

   /* public  String airList(){

        return  "";
    }*/

    @RequestMapping(value="/list")
    public String airList(Model model, HttpSession session,
                          @RequestParam(value="choose",required=false) String choose,
                          @RequestParam(value="pageIndex",required=false) String pageIndex) {
        System.out.println("=============================================================------->>>>>>>>>>>>>>>>>>>>>>>>>>>");
        logger.info("getHotleRuzhuXxList -- > choose: " + choose);
        logger.info("getHotleRuzhuXxList -- > pageIndex: " + pageIndex);
        List<Air_quality_index> airList=null;
        //页面容量
        int pageSize = Constants.pageSize;
        //当前页码
        Integer currentPageNo = 1;
        if(pageIndex != null){
            try{
                currentPageNo = Integer.valueOf(pageIndex);
            }catch (NumberFormatException e) {
                // TODO: handle exception
                e.printStackTrace();
            }
        }
        //总数量（表）
        int totalCount = 0;
        try {
            totalCount = airqualityService.getAirCount(choose);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        //总页数
        PageSupport pages = new PageSupport();
        pages.setCurrentPageNo(currentPageNo);
        pages.setPageSize(pageSize);
        pages.setTotalCount(totalCount);
        int totalPageCount = pages.getTotalPageCount();
        //控制首页和尾页
        if(currentPageNo < 1){
            currentPageNo = 1;
        }else if(currentPageNo > totalPageCount){
            currentPageNo = totalPageCount;
        }

        try {
            airList=airqualityService.getAirList(choose,currentPageNo,pageSize);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

       /* for (Air_quality_index air : airList) {
            logger.info("Book -- /////////////////////////////////////////////////////////////////> Book: " + air.toString());
        }*/
        model.addAttribute("pages", pages);
        model.addAttribute("choose", choose);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("airList", airList);
        model.addAttribute("totalCount", totalCount);
        return  "ShowAir";
    }

    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public  String addAir(){
        return  "AddAir";
    }

    @RequestMapping(value = "/modifyAir",method = RequestMethod.GET)
    public  String modifyAir(){
        System.out.println("______________________________________Welcome !!");
        return  "AirModify";
    }

    @RequestMapping(value = "/modifyByid")
    public  String modifyByid(Model model,  @RequestParam(value="id",required=false) String id){
        Air_quality_index air=null;
        try {
            air=airqualityService.selectAirkByid(id);
          /*  System.out.println("ccccccccccccccccccccccccccccccccc"+air.toString());*/

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("air",air);

        return "AirModify";
    }

    @RequestMapping(value = "/addair",method = RequestMethod.POST)
    public  String addRuZhus(Model model,Air_quality_index air,
            /*    @RequestParam(value="roomid",required=false) String roomid ,*/
                             @RequestParam(value="monitor_time",required=false) String monitor_time ,
                             @RequestParam(value="id",required=false) String id ,
                             HttpSession session){
        System.out.println("/////////////////////////////////////"+air);
        Date time=null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date=sdf.parse(monitor_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        air.setMonitor_time(date);
        air.setLast_modify_time(new Date());
        System.out.println("============================================================================");
        try {
            if(airqualityService.add(air)){

                return "redirect:/airquality/list";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "AddAir";
    }



    @RequestMapping(value = "/addmodify",method = RequestMethod.POST)
    public  String addmodify(Air_quality_index air,  @RequestParam(value="monitor_time",required=false) String monitor_time ){
        System.out.println("dddddddddddddddddddddddddddddddd"+air.toString());

        System.out.println("/////////////////////////////////////"+monitor_time);
        Date time=null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date=sdf.parse(monitor_time);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        /*日期特殊处理*/
        air.setMonitor_time(date);
        air.setLast_modify_time(new Date());
        try {
            if(airqualityService.modify(air)){
                System.out.println("修改成功！");
                return "redirect:/airquality/list";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "AirModify";
    }


    //删除
    @RequestMapping(value = "/deleteAirById.html",method = RequestMethod.GET)
    @ResponseBody
    public Object deleteAir(/*@RequestParam Integer id*/
            @RequestParam(value="id",required=false) String id ){
        logger.info("--------------------------------------------id" +id);
        System.out.println(id);
     /*   HashMap<String,String> result=new HashMap<String,String>();*/
        boolean bool= false;
        try {
            bool = airqualityService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        if (bool){
            System.out.println("删除成功！！！--------------------------------------------------");
            return "true";
           /* result.put("delResult","true");*/
        }else {
        /*    result.put("delResult","false");*/
            System.out.println("删除失败I！！！--------------------------------------------------");
        }
     /*   return JSONArray.toJSONString(result);*/
        return "false";
    }
}
