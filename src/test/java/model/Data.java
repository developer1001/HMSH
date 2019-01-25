package model;

import java.util.List;

/**
 * 报文主体，(data.data)
 */
public class Data {
    private List tagName;
    private List tagDetail;

    public List getTagName() {
        return tagName;
    }

    public void setTagName(List tagName) {
        this.tagName = tagName;
    }

    public List getTagDetail() {
        return tagDetail;
    }

    public void setTagDetail(List tagDetail) {
        this.tagDetail = tagDetail;
    }
}
