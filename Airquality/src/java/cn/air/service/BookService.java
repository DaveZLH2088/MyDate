package cn.air.service;

import cn.air.pojo.Book;
import cn.air.pojo.User;

import java.util.List;

public interface BookService {

    /**
     * 用户登录
     * @param name
     * @param password
     * @return
             */
    public User login(String name, String password);

    public List<Book> getBookList(String choose,
                                          String likes,
                                          Integer currentPageNo,
                                          Integer pageSize)throws Exception;

    public int getBookCount(String choose,
                                    String likes
    )throws Exception;

    public boolean add(Book book) throws Exception;

    public Book selectBookByid(String id)throws Exception;

    public boolean modify(Book book) throws Exception;
}
