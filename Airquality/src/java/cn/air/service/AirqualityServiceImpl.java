package cn.air.service;

import cn.air.dao.AirqualityMapper;
import cn.air.pojo.Air_quality_index;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
@Service
public class AirqualityServiceImpl implements  AirqualityService {

    @Resource private AirqualityMapper airqualityMapper;

    @Override
    public List<Air_quality_index> getAirList(String choose, Integer currentPageNo, Integer pageSize) throws Exception {
        return airqualityMapper.getAirList(choose,(currentPageNo-1)*pageSize,pageSize);
    }

    @Override
    public int getAirCount(String choose) throws Exception {
        return airqualityMapper.getAirCount(choose);
    }

    @Override
    public boolean add(Air_quality_index air) throws Exception {
        boolean flag = false;
        if(airqualityMapper.add(air) > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public Air_quality_index selectAirkByid(String id) throws Exception {
        return airqualityMapper.getAirByid(id);
    }

    @Override
    public boolean modify(Air_quality_index air) throws Exception {
        boolean flag = false;
        if(airqualityMapper.modify(air) > 0){
            flag = true;
        }
        return flag;
    }

    @Override
    public boolean delete(String id) throws Exception {
        boolean flag = false;
        if(airqualityMapper.deleteAir(id) > 0){
            flag = true;
        }
        return flag;
    }
}
