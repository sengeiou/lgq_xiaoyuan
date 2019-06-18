/*
 * All rights Reserved, Designed By DataDriver
 * Copyright:    DataDriver.Inc
 * Company:      Zhuo Wo Infomation Technology (ShangHai) CO.LTD
 */
package com.yuan.base.model.tree;

/**
 * ZtreeNode
 *
 * @Description: 抽象Jquery Ztree model
 */
public abstract class AbstractZtreeNode {

    /**
     * 唯一主键
     */
    public String id;
    /**
     * 父节点ID
     */
    public String pId;
    /**
     * 节点名称
     */
    public String name;

    /**
     * true:展开;false:折叠
     */
    public String open;
    /**
     * true:选择;false:不选择
     */
    public String checked;
    /**
     * [图片路径]只设置Icon,展开和折叠都同一个图标
     */
    public String icon;
    /**
     * [className]利用 className 设置个性化图标
     */
    public String iconSkin;
    /**
     * 展开时的icon
     */
    public String iconOpen;
    /**
     * 折叠时的icon
     */
    public String iconClose;

    public String getChecked() {
        return checked;
    }

    public void setChecked(String checked) {
        this.checked = checked;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getpId() {
        return pId;
    }

    public void setpId(String pId) {
        this.pId = pId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getOpen() {
        return open;
    }

    public void setOpen(String open) {
        this.open = open;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getIconSkin() {
        return iconSkin;
    }

    public void setIconSkin(String iconSkin) {
        this.iconSkin = iconSkin;
    }

    public String getIconOpen() {
        return iconOpen;
    }

    public void setIconOpen(String iconOpen) {
        this.iconOpen = iconOpen;
    }

    public String getIconClose() {
        return iconClose;
    }

    public void setIconClose(String iconClose) {
        this.iconClose = iconClose;
    }

}
