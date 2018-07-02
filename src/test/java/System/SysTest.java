package System;

import com.zgc.base.WebServiceClient.User.invoke.Invokes;
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

    @Test
    public void testEncode(){
//        String s = EncodeUtil.str2MD5("123456");
//        System.out.println(s);
    }

    @After
    public void after(){
        System.out.println("测试工作完毕");
    }

    @Test
    public  void UserWSTest(){
        //默认关闭webservice,使用前需要解封web.xml文件相关配置行
          System.out.println( new Invokes().returnMsg());
//        System.out.println( new Invokes().returnMsg2());
    }
}
