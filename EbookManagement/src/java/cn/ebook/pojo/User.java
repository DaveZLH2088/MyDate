package cn.ebook.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {
    private  Integer id;
    private String name;
    private  String password;
    private  Integer age;
    private  String sex;
    private  String nickname;
    private  Integer usertype;

}
