package com.zgc.base.WebServiceClient.User.invoke;

import com.zgc.base.WebService.UserWebService;
import org.apache.cxf.jaxws.JaxWsProxyFactoryBean;

public class Invokes {

    public String returnMsg(){
        JaxWsProxyFactoryBean factory = new JaxWsProxyFactoryBean();
        factory.setServiceClass(UserWebService.class);
        factory.setAddress("http://localhost:8081/HMSH/webService/UWS?wsdl");
        UserWebService client = (UserWebService) factory.create();
        String response = client.getUserInfo("老杨头");
        System.out.println("Response:"+response);
        return response;
    }
}
