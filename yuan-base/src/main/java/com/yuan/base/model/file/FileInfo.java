package com.yuan.base.model.file;

import com.sun.xml.internal.ws.developer.Serialization;
import lombok.*;
import java.util.Date;

/**
 * <p>
 * 文件信息表
 *
 * </p>
 *
 * @author stylefeng
 * @since 2018-12-07
 */
@Getter
@Setter
@ToString
@Serialization
@NoArgsConstructor
@AllArgsConstructor
public class FileInfo {

    private static final long serialVersionUID = 1L;

    /**
     * 主键id
     */
    private String fileId;
    /**
     * base64编码的文件
     */
    private String fileData;
    /**
     * 创建时间
     */
    private Date createTime;
    /**
     * 修改时间
     */
    private Date updateTime;
    /**
     * 创建用户
     */
    private Long createUser;
    /**
     * 修改用户
     */
    private Long updateUser;

}
