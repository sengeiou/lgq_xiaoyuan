package com.yuan.model.family.domain;

import com.yuan.common.base.BaseEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.util.Date;

/**
 * 家主基本表 family_base_info
 *
 * @author lugongqi
 * @date 2019-01-27
 */
public class FamilyMan extends BaseEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private Long id;
    /**
     * 出生时间
     */
    private String birthday;
    /**
     * 用户名
     */
    private String name;
    /**
     * 创建人
     */
    private String createdMan;
    /**
     * 密码加密盐
     */
    private String salt;
    /**
     * 性别
     */
    private Integer sex;
    /**
     * 年龄
     */
    private Integer age;
    /**
     * 手机号
     */
    private String phone;
    /**
     * 用户类别
     */
    private Integer userType;
    /**
     * 用户状态
     */
    private Integer status;
    /**
     * 所属家庭
     */
    private Integer familyId;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 头像
     */
    private String urlPath;
    /**  */
    private String email;

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setCreatedMan(String createdMan) {
        this.createdMan = createdMan;
    }

    public String getCreatedMan() {
        return createdMan;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getSalt() {
        return salt;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getSex() {
        return sex;
    }

    public void setAge(Integer age) {
        this.age = age;
    }

    public Integer getAge() {
        return age;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getPhone() {
        return phone;
    }

    public void setUserType(Integer userType) {
        this.userType = userType;
    }

    public Integer getUserType() {
        return userType;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setFamilyId(Integer familyId) {
        this.familyId = familyId;
    }

    public Integer getFamilyId() {
        return familyId;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setUrlPath(String urlPath) {
        this.urlPath = urlPath;
    }

    public String getUrlPath() {
        return urlPath;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("birthday", getBirthday())
                .append("name", getName())
                .append("createdMan", getCreatedMan())
                .append("salt", getSalt())
                .append("sex", getSex())
                .append("age", getAge())
                .append("phone", getPhone())
                .append("userType", getUserType())
                .append("status", getStatus())
                .append("familyId", getFamilyId())
                .append("createTime", getCreateTime())
                .append("urlPath", getUrlPath())
                .append("email", getEmail())
                .toString();
    }
}
