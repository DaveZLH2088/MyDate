package cn.air.dao;

import cn.air.pojo.Ebookentry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface EbookkentryMapper {

    /**
     * 分页显示图书信息
     * @param choose
     * @param likes
     * @param currentPageNo
     * @param pageSize
     * @return
     * @throws Exception
     */
    public List<Ebookentry> getEbookentryList(@Param(value = "choose") String choose,
                                                @Param(value = "likes") String likes,
                                                @Param(value = "from") Integer currentPageNo,
                                                @Param(value = "pageSize") Integer pageSize)throws Exception;

    public int getEbookentryCount(@Param(value = "choose") String choose,
                                    @Param(value = "likes") String likes
    )throws Exception;
}
