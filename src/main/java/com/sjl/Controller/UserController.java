package com.sjl.Controller;

import com.sjl.PO.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller  //表示控制器  等价于在配置文件里面写bean id
public class UserController{

     /**
      * 接收页面请求的json数据，并以json格式返回数据
      * */
     @RequestMapping(value="/testJson",method = RequestMethod.POST,consumes = "application/json")
     //@ReponseBody:是把user对象转换为json，因为响应端的浏览器不认识java对象，但认识js对象标记。
    @ResponseBody
     //@RequestBody:把请求的json字符串（data后面的内容）转换成user对象
    public User testJson(@RequestBody User user){
         System.out.println(user);
         //并返回json格式
         return user;
     }

     /**
      * 接收RESTful风格的请求，其接收方式为GET
      * */
     //RESTful风格通过对象id找到user对象
     @RequestMapping(value = "/user/{id}",method = RequestMethod.GET)
     @ResponseBody
     public User selectUser(@PathVariable("id") String id){
         //查看数据接收
         System.out.println("id="+id);
         User user=new User();
         //模拟根据id查询出到用户对象数据
         if(id.equals("1234")){
             user.setUsername("tom");
         }
         //返回JSON格式的数据
         return user;
     }
}