package cn.air.controller;

import cn.air.pojo.Book;
import cn.air.pojo.User;
import cn.air.service.BookService;
import cn.air.tools.Constants;
import cn.air.tools.PageSupport;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping(value = "/book")
public class BookController {

    private Logger logger = Logger.getLogger(BookController.class);
    @Resource private BookService bookService;

    @RequestMapping(value="/dologin",method= RequestMethod.POST)
    public String doLogin(@RequestParam String name, @RequestParam String password, HttpServletRequest request, HttpSession session) {
        logger.debug("doLogin====================================");
        //调用service方法，进行用户匹配
        User user = null;
        try {
            user = bookService.login(name, password);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        if (null != user) {//登录成功
            System.out.println(">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>登录成功！");
            //放入session
            session.setAttribute(Constants.USER_SESSION, user);
            //页面跳转（main.jsp）
            return "redirect:/book/list";
        } else {
            //页面跳转（login.jsp）带出提示信息--转发
            request.setAttribute("error", "用户名或密码不正确");
            return "bookLogin";
        }
    }

        @RequestMapping(value = "/luck")
        public  String luck(){
        return "play001" ;
        }

    @RequestMapping(value="/list")
    public String getHotleRuzhuXxList(Model model, HttpSession session,
                                      @RequestParam(value="choose",required=false) String choose,
                                      @RequestParam(value="likes",required=false) String likes,
                                      @RequestParam(value="pageIndex",required=false) String pageIndex) {
        System.out.println("=============================================================------->>>>>>>>>>>>>>>>>>>>>>>>>>>");
        logger.info("getHotleRuzhuXxList -- > choose: " + choose);
        logger.info("getHotleRuzhuXxList -- > likes: " + likes);
        logger.info("getHotleRuzhuXxList -- > pageIndex: " + pageIndex);

        List<Book> bookList=null;
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
            totalCount = bookService.getBookCount(choose,likes);
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
            bookList=bookService.getBookList(choose,likes,currentPageNo,pageSize);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        for (Book book : bookList) {
            logger.info("Book -- /////////////////////////////////////////////////////////////////> Book: " + book.toString());
        }
        model.addAttribute("pages", pages);
        model.addAttribute("choose", choose);
        model.addAttribute("likes", likes);
        model.addAttribute("pageSize", pageSize);
        model.addAttribute("bookList", bookList);
        model.addAttribute("totalCount", totalCount);
        return  "ShowBooks";
    }
    @RequestMapping(value = "/add",method = RequestMethod.GET)
    public  String addBook(){
        return  "AddBook";
    }

    @RequestMapping(value = "/addbook",method = RequestMethod.POST)
    public  String addRuZhus(Model model,Book book,
                         /*    @RequestParam(value="roomid",required=false) String roomid ,*/
                             @RequestParam(value="publishdate",required=false) String publishdate ,
                             HttpSession session){
        System.out.println("/////////////////////////////////////"+book);
        Date time=null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date=sdf.parse(publishdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        System.out.println("============================================================================");

    /* HotleRoom room= roomService.getRmmotype("8001");
        String roomtype=room.getRoomtype();
        System.out.println("/////////////////////////////////////"+roomtype);
        ruzhuXx.setRoomtype(roomtype);*/
        /*   ruzhuXx.setRtime(new Date());*/
        try {
            if(bookService.add(book)){

                return "redirect:/book/list";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "AddBook";
    }

    @RequestMapping(value = "/modifyByid")
    public  String modifyByid(Model model,  @RequestParam(value="id",required=false) String id){
        Book book=null;
        try {
            book=bookService.selectBookByid(id);
            System.out.println("ccccccccccccccccccccccccccccccccc"+book.toString());

        } catch (Exception e) {
            e.printStackTrace();
        }
        model.addAttribute("book",book);

        return "modifyBook";
    }

    @RequestMapping(value = "/addmodify",method = RequestMethod.POST)
    public  String addmodify(Book book,  @RequestParam(value="publishdate",required=false) String publishdate ){
        System.out.println("dddddddddddddddddddddddddddddddd"+book.toString());

        System.out.println("/////////////////////////////////////"+publishdate);
        Date time=null;
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = null;
        try {
            date=sdf.parse(publishdate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        /*日期特殊处理*/
        book.setPublishdate(date);
        try {
            if(bookService.modify(book)){
                System.out.println("修改成功！");
                return  "redirect:/book/list";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "modifyBook";
    }
}
