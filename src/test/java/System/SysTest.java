package System;

import com.zgc.controller.UserController;
import com.zgc.model.User;
import com.zgc.util.EncodeUtil;
import com.zgc.util.StringUtil;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

public class SysTest {
    @Before
    public void before(){
        System.out.println("所有方法开始测试");
    }
//    @Test
//    public void addUser(){
//        User user = new User();
//        user.setUser_name("test"+((int)(Math.random()*1000)));
//        user.setPassword("test");
//        user.setAge(((int)(Math.random()*50))+11);
//         System.out.println(user);
//    }

    @Test
    public void testEncode(){
//        String s = EncodeUtil.str2MD5("123456");
//        System.out.println(s);
    }

    @After
    public void after(){
        System.out.println("测试工作完毕");
    }
}
