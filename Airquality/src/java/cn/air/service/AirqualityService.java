package cn.air.service;

import cn.air.pojo.Air_quality_index;

import java.util.List;

public interface AirqualityService {

    public List<Air_quality_index> getAirList(String choose,
                                               Integer currentPageNo,
                                               Integer pageSize)throws Exception;

    public int getAirCount(String choose
    )throws Exception;

    public boolean add(Air_quality_index air) throws Exception;

    public Air_quality_index selectAirkByid(String id)throws Exception;

    public boolean modify(Air_quality_index air) throws Exception;

    public boolean delete(String id) throws Exception;
}
