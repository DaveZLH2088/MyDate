package cn.ebook.dao;

import cn.ebook.pojo.Book;
import cn.ebook.pojo.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BookMangerMapper {
    /**
     * 登录 通过mname,密码 获取Hotlemanger
     * @param name
     * @return
     */
    public User getLogin(@Param("name")String name, @Param("password")String passwords);

    /**
     * 分页显示图书信息
     * @param choose
     * @param likes
     * @param currentPageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Book> getBookList(@Param(value = "choose") String choose,
                                        @Param(value = "likes") String likes,
                                        @Param(value = "from") Integer currentPageNo,
                                        @Param(value = "pageSize") Integer pageSize)throws Exception;

    /**
     * 查询总记录数
     * @param choose
     * @param likes
     * @return
     * @throws Exception
     */
    public int getBookCount(@Param(value = "choose") String choose,
                                  @Param(value = "likes") String likes
    )throws Exception;


    /**
     * 添加图书信息
     * @param book
     * @return
     * @throws Exception
     */
    public Integer add(Book book) throws Exception;

    /**
     * 修改图书信息
     * @param book
     * @return
     * @throws Exception
     */
    public Integer modify(Book book)throws Exception;

    /**
     * 通过id获取图书信息
     * @param id
     * @return
     */
    public  Book getBookByid(@Param(value = "id")String id);

    /**
     * 删除图书信息
     * @param id
     * @return
     * @throws Exception
     */
    public Integer deleteBook(@Param(value = "id") Integer id)throws Exception;

}
