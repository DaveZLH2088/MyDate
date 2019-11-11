package cn.air.dao;

import cn.air.pojo.Air_quality_index;
import cn.air.pojo.Ebookentry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AirqualityMapper {


    public List<Air_quality_index> getAirList(@Param(value = "choose") String choose,
                                                     @Param(value = "from") Integer currentPageNo,
                                                     @Param(value = "pageSize") Integer pageSize)throws Exception;

    public int getAirCount(@Param(value = "choose") String choose
    )throws Exception;


    public Integer add(Air_quality_index air) throws Exception;


    public Integer modify(Air_quality_index air)throws Exception;


    public  Air_quality_index getAirByid(@Param(value = "id")String id);


    public Integer deleteAir(@Param(value = "id") String id)throws Exception;
}
