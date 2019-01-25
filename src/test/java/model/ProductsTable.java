package model;

/**
 * 比较多个险种的信息,完整报文体
 */
public class ProductsTable {
    private String result_code;
    private String result_message;
    private String global_request_id;
    private String authentication_info;
    private Data data;

    public String getResult_code() {
        return result_code;
    }

    public void setResult_code(String result_code) {
        this.result_code = result_code;
    }

    public String getResult_message() {
        return result_message;
    }

    public void setResult_message(String result_message) {
        this.result_message = result_message;
    }

    public String getGlobal_request_id() {
        return global_request_id;
    }

    public void setGlobal_request_id(String global_request_id) {
        this.global_request_id = global_request_id;
    }

    public String getAuthentication_info() {
        return authentication_info;
    }

    public void setAuthentication_info(String authentication_info) {
        this.authentication_info = authentication_info;
    }

    public Data getData() {
        return data;
    }

    public void setData(Data data) {
        this.data = data;
    }
}
