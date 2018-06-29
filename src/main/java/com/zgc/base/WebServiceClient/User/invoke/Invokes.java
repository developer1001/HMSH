package com.zgc.base.WebServiceClient.User.invoke;

import com.zgc.base.WebServiceClient.User.UserWebService;
import com.zgc.base.WebServiceClient.User.UserWebServiceImplService;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

public class Invokes {

    /**
     * 第一种实现方式：通过JaxWsProxyFactoryBean代理类来设定服务处理类和服务地址，无须额外的客户端配置。
     * @return
     */
    public String returnMsg(){
        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
        factory.setServiceClass(UserWebService.class);
        factory.setAddress("http://localhost:8081/HMSH/webService/UWS?wsdl");
        UserWebService client = (UserWebService) factory.create();
        String response = client.getUserInfo("老杨头");
        System.out.println("Response:"+response);
        return response;
    }

    public String returnMsg2(){
        UserWebService uws = new UserWebServiceImplService().getUserWebServiceImplPort();
        String response = uws.getUserInfo("我是老杨头啊");
        return "";
    }
}
