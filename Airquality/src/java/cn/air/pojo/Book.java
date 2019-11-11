package cn.air.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Book {
    private  Integer id;
    private  String bname;
    private  String bauthor;
    private  String publish;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date publishdate;
    private Integer  Page;
    private float  prices;
    private  String Content;
}
