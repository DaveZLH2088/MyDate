package cn.air.service;

import cn.air.dao.BookMangerMapper;
import cn.air.pojo.Book;
import cn.air.pojo.User;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {

    @Resource
    private BookMangerMapper bookMangerMapper;

    @Override
    public User login(String name, String password) {
        User user =bookMangerMapper.getLogin(name,password);
        //匹配密码
        if(null != user){
            if(!user.getPassword().equals(password))
                user = null;
        }
        return user;
    }

    /**
     * 图书信息分页显示
     * @param choose
     * @param likes
     * @param currentPageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    @Override
    public List<Book> getBookList(String choose, String likes, Integer currentPageNo, Integer pageSize) throws Exception {
        return bookMangerMapper.getBookList(choose,likes,(currentPageNo-1)*pageSize,pageSize);
    }

    @Override
    public int getBookCount(String choose, String likes) throws Exception {
        return bookMangerMapper.getBookCount(choose,likes);
    }

    /**
     * 添加图书
     * @param book
     * @return
     * @throws Exception
     */
    @Override
    public boolean add(Book book) throws Exception {
        boolean flag = false;
        if(bookMangerMapper.add(book) > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Book selectBookByid(String id) throws Exception {
        return bookMangerMapper.getBookByid(id);
    }

    @Override
    public boolean modify(Book book) throws Exception {
            // TODO Auto-generated method stub
            boolean flag = false;
            if(bookMangerMapper.modify(book) > 0){
                flag = true;
            }
            return flag;
    }


}
