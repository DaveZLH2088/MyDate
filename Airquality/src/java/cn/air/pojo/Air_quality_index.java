package cn.air.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Air_quality_index {
    private  Integer id ;
    private Integer district_id;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date monitor_time;
    private String name;
    private  Integer pm10;
    private  Integer pm25;
    private  String monitoring_station;
    private  Date last_modify_time;


}
