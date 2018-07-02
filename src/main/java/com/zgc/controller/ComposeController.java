package com.zgc.controller;

import com.alibaba.fastjson.JSONObject;
import com.google.gson.Gson;
import com.zgc.util.BusinessCode;
import com.zgc.util.EncodeUtil;
import com.zgc.util.PPXHttpJsonResult;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import sun.misc.BASE64Encoder;
import javax.servlet.http.HttpServletRequest;
import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;
import java.util.UUID;
@Controller
public class ComposeController {

    //{"code":"10106","data":"","desc":"invalid parameter|invalid X-Param","sid":"hts000c61f6@chbcde0e95337c477400"}

    /**
     *ifly.appid = 5ad467c2
     * ifly.url = http://api.xfyun.cn/v1/service/v1
     * ifly.appkey = 14d5fbc8d5c0bb0dccc523b83f7fa679
     */
    private static String buildImgPath(HttpServletRequest request) {
        String path = "upload";
        path = request.getRealPath(path);
        File dir = new File(path);
        if (!dir.exists()) {
            try {
                dir.mkdirs();
            } catch (Exception e) {
                //log.error("error", e);
            }
        }
        return path;
    }


    // 500字的合成语音
    @ResponseBody
    @RequestMapping(value = "/api/v1/tts", method = RequestMethod.POST)
    public PPXHttpJsonResult<JSONObject> tts(String description, HttpServletRequest request) throws UnsupportedEncodingException {
        PPXHttpJsonResult<JSONObject> result = new PPXHttpJsonResult<>();
        if (StringUtils.isBlank(description)) {
            result.setMsg("description不能为空!");
            result.setCode(BusinessCode.CODE_400);
            return result;
        }
        // 调用第三方接口
        String url = "http://api.xfyun.cn/v1/service/v1";
        JSONObject jsonObject = sendPostRequest(url, description, request);
        String str = jsonObject.getString("data");
        if (StringUtils.isNotBlank(str)){
            JSONObject object = new JSONObject();
            object.put("data", str);
            result.setData(object);
        } else {
            result.setMsg(jsonObject.getString("info"));
            String code = jsonObject.getString("code");
            if(StringUtils.isNotBlank(code)) {
                result.setCode(Integer.valueOf(code));
            }
        }
        return result;
    }


    public static JSONObject sendPostRequest(String url, String description, HttpServletRequest request) throws UnsupportedEncodingException {
        JSONObject jsonObject = new JSONObject();
        HttpURLConnection httpURLConnection = null;
        OutputStream out = null;

        String appid = "5ad467c2";
        String appKey = "14d5fbc8d5c0bb0dccc523b83f7fa679";
        String xParam = "{\"auf\":\"audio/L16;rate=16000\",\"aue\":\"lame\",\"voice_name\":\"xiaoyan\",\"speed\":\"50\",\"volume\":\"50\",\"pitch\":\"50\",\"engine_type\":\"intp65\",\"text_type\":\"text\"}";
        // Base64加密
        BASE64Encoder encoder = new BASE64Encoder();
        String param = encoder.encode(xParam.getBytes("utf-8")).replaceAll("[\\s*\t\n\r]", "");
        System.out.println("@@@@@"+param);
        String curTime = String.valueOf(new Date().getTime() / 1000);
        // MD5加密
        String checkSum = EncodeUtil.encode(appKey + curTime + param);
        try {
            URL sendUrl = new URL(url);
            httpURLConnection = (HttpURLConnection) sendUrl.openConnection();
            //post方式请求
            httpURLConnection.setRequestMethod("POST");
            //设置头部信息
            httpURLConnection.setRequestProperty("X-Appid", appid);
            httpURLConnection.setRequestProperty("X-CurTime", curTime);
            httpURLConnection.setRequestProperty("X-Param", param);
            httpURLConnection.setRequestProperty("X-CheckSum", checkSum);
            //一定要设置 Content-Type 要不然服务端接收不到参数
            httpURLConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            httpURLConnection.setRequestProperty("charset", "utf-8");
            httpURLConnection.setUseCaches(false);
            //指示应用程序要将数据写入URL连接,其值默认为false（是否传参）
            httpURLConnection.setDoOutput(true);
            httpURLConnection.setDoInput(true);
            //传入参数
            String text = "text=" + URLEncoder.encode(description, "utf-8");
            out = httpURLConnection.getOutputStream();
            out.write(text.getBytes());
            out.flush(); //清空缓冲区,发送数据
            out.close();
            String contentType = httpURLConnection.getContentType();
            if (contentType.equals("audio/mpeg")) {
                InputStream stream = httpURLConnection.getInputStream();
                byte[] bytes = readInputStream(stream);
                if (null != bytes && bytes.length > 0) {
                    System.out.println("读取到：" + bytes.length + " 字节");
                    String id = UUID.randomUUID().toString().replace("-", "").toLowerCase();
                    String fileName = id + ".mp3";
                    writeFile(bytes, fileName, request);
                    // 上传七牛
                    File file = new File(buildImgPath(request) + "/" + fileName);
                    if (file.exists() && file.length() > 0) {
                        jsonObject.put("data","success");
                    }else{
                        jsonObject.put("data","false");
                    }

                } else {
                    System.out.println("没有从该连接获得内容");
                }

            } else {
                InputStream inputStream = httpURLConnection.getInputStream();
                String str = readInputStreamToString(inputStream);
                // 进行解析
                Gson gson = new Gson();
                JSONObject json = gson.fromJson(str, JSONObject.class);
                String desc = json.getString("desc");
                String code = json.getString("code");
                jsonObject.put("info",desc);
                jsonObject.put("code",code);
            }

        } catch (Exception e) {
            e.printStackTrace();

        }
        return jsonObject;

    }


    /**
     * 从输入流中获取数据
     *
     * @param inStream 输入流
     * @return
     * @throws Exception
     */
    public static byte[] readInputStream(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int len = 0;
        while ((len = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        inStream.close();
        return outStream.toByteArray();
    }

    /**
     * @param bytes    数据流
     * @param fileName 文件保存时的名称
     */

    public static void writeFile(byte[] bytes, String fileName, HttpServletRequest request) {
        try {
            File file = new File(buildImgPath(request) + "/" + fileName);
            FileOutputStream fops = new FileOutputStream(file);
            fops.write(bytes);
            fops.flush();
            fops.close();
            System.out.println("音频已经写入路径!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * 从输入流中获取数据字符串
     *
     * @param inStream 输入流
     * @return
     * @throws Exception
     */
    public static String readInputStreamToString(InputStream inStream) throws Exception {
        ByteArrayOutputStream outStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[8192];
        int len = 0;
        while ((len = inStream.read(buffer)) != -1) {
            outStream.write(buffer, 0, len);
        }
        inStream.close();
        return outStream.toString();
    }
}
