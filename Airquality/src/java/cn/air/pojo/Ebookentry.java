package cn.air.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Ebookentry {
    private  Integer id;
    private  Integer categoryId;
    private  String title ;
    private  String summary ;
    private  String uploaduser ;
    private Date createdate ;
}
