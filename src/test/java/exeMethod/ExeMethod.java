package exeMethod;

import com.alibaba.fastjson.JSONObject;
import model.*;

import java.util.*;

public class ExeMethod {
    public static void main(String[] args){
        /*
        information :
         */
        LinkedHashMap<String,String> map1 = new LinkedHashMap();
        map1.put("age","投保年龄");
        LinkedHashMap<String,String> map2 = new LinkedHashMap();
        map2.put("payment","缴费期限");

        LinkedHashMap<String,String> map3 = new LinkedHashMap();
        map3.put("riskName","常青树（多倍版）");
        map3.put("age","30");
        map3.put("sex","男");
        map3.put("prem","7000元");
        map3.put("amont","30万元");

        LinkedHashMap<String,String> map4 = new LinkedHashMap();
        map4.put("riskName","常青树（智慧版）");
        map4.put("age","40");
        map4.put("sex","女");
        map4.put("prem","9000元");
        map4.put("amont","40万元");

        List<LinkedHashMap<String, String>> info_attributeCodes = new ArrayList();
        info_attributeCodes.add(map1);
        info_attributeCodes.add(map2);
        List<LinkedHashMap<String, String>> info_attributeValues = new ArrayList();
        info_attributeValues.add(map3);
        info_attributeValues.add(map4);

        /*
        responsibility:
         */
        LinkedHashMap<String,String> resp_map1 = new LinkedHashMap();
        resp_map1.put("receipt","固定领取");
        LinkedHashMap<String,String> resp_map2 = new LinkedHashMap();
        resp_map2.put("death","身故保障");

        LinkedHashMap<String,String> resp_map3 = new LinkedHashMap();
        resp_map3.put("riskName","常青树（多倍版）");
        resp_map3.put("receipt","XXXX");
        resp_map3.put("death","55万");

        LinkedHashMap<String,String> resp_map4 = new LinkedHashMap();
        resp_map4.put("riskName","常青树（智慧版）");
        resp_map4.put("receipt","XXXX");
        resp_map4.put("death","40万");

        List<LinkedHashMap<String, String>> resp_attributeCodes = new ArrayList();
        resp_attributeCodes.add(resp_map1);
        resp_attributeCodes.add(resp_map2);
        List<LinkedHashMap<String, String>> resp_attributeValues = new ArrayList();
        resp_attributeValues.add(resp_map3);
        resp_attributeValues.add(resp_map4);

        /*
        clause :
         */
        LinkedHashMap<String,String> clause_map1 = new LinkedHashMap();
        clause_map1.put("disclaimer","免责条款");

        LinkedHashMap<String,String> clause_map3 = new LinkedHashMap();
        clause_map3.put("riskName","常青树（多倍版）");
        clause_map3.put("disclaimer","XXXXXX");

        LinkedHashMap<String,String> clause_map4 = new LinkedHashMap();
        clause_map4.put("riskName","常青树（智慧版）");
        clause_map4.put("disclaimer","XXXXXXXXXXX");

        List<LinkedHashMap<String, String>> clause_attributeCodes = new ArrayList();
        clause_attributeCodes.add(clause_map1);
        List<LinkedHashMap<String, String>> clause_attributeValues = new ArrayList();
        clause_attributeValues.add(clause_map3);
        clause_attributeValues.add(clause_map4);

        Data data = new Data();
        //tagName
        LinkedHashMap<String,String> map5 = new LinkedHashMap();
        map5.put("tag","投保信息");
        map5.put("key","information");
        LinkedHashMap<String,String> map6 = new LinkedHashMap();
        map6.put("tag","保障责任");
        map6.put("key","responsibility");
        LinkedHashMap<String,String> map7 = new LinkedHashMap();
        map7.put("tag","免责条款");
        map7.put("key","clause");
        List<LinkedHashMap<String, String>> tagName = new ArrayList();
        tagName.add(map5);
        tagName.add(map6);
        tagName.add(map7);
        data.setTagName(tagName);
        //tagDetail
        //投保信息
        LinkedHashMap<String,Object> information = new LinkedHashMap();
        information.put("attributeCodes",info_attributeCodes);
        information.put("attributeValues",info_attributeValues);
        //保障责任
        LinkedHashMap<String,Object> responsibility = new LinkedHashMap();
        responsibility.put("attributeCodes",resp_attributeCodes);
        responsibility.put("attributeValues",resp_attributeValues);
        //免责条款
        LinkedHashMap<String,Object> clause = new LinkedHashMap();
        clause.put("attributeCodes",clause_attributeCodes);
        clause.put("attributeValues",clause_attributeValues);

        LinkedHashMap<String,Object> mapN = new LinkedHashMap();
        mapN.put("information",information);
        mapN.put("responsibility",responsibility);
        mapN.put("clause",clause);
        List list4 = new ArrayList();
        list4.add(mapN);
        data.setTagDetail(list4);

        ProductsTable productsTable = new ProductsTable();
        productsTable.setResult_code("true");
        productsTable.setResult_message("查询成功");
        productsTable.setAuthentication_info("79a59b33fe3c135199aff385670b144d");
        productsTable.setGlobal_request_id("9c3b8f04815c460fa3dde32f642c80ac");
        productsTable.setData(data);

        String json = JSONObject.toJSONString(productsTable);
        System.out.print(json);
    }
}
