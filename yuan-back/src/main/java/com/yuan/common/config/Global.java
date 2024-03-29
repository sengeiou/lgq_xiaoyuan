package com.yuan.common.config;

import java.io.FileNotFoundException;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.yuan.common.utils.StringUtils;
import com.yuan.common.utils.YamlUtil;

/**
 * 全局配置类
 *
 * @author lws
 */
public class Global {
    private static final Logger log = LoggerFactory.getLogger(Global.class);

    private static String NAME = "application.yml";

    /**
     * 内置跟部门的id
     */
    public static final long ROOT_DEPT_ID=1812121212120000L;
    /**
     * 顶级管理员id
     */
    public static final long TOP_ADMIN_ID=1812120000000000L;

    public static final long ROLE_ID_DEFAULT=1812120000000002L;

    /**
     * 当前对象实例
     */
    private static Global global = null;

    /**
     * 保存全局属性值
     */
    private static Map<String, String> map = new HashMap<String, String>();

    private Global() {
    }

    /**
     * 静态工厂方法 获取当前对象实例 多线程安全单例模式(使用双重同步锁)
     */

    public static synchronized Global getInstance() {
        if (global == null) {
            synchronized (Global.class) {
                if (global == null)
                    global = new Global();
            }
        }
        return global;
    }

    /**
     * 获取配置
     */
    public static String getConfig(String key) {
        String value = map.get(key);
        if (value == null) {
            Map<?, ?> yamlMap = null;
            try {
                yamlMap = YamlUtil.loadYaml(NAME);
                value = String.valueOf(YamlUtil.getProperty(yamlMap, key));
                map.put(key, value != null ? value : StringUtils.EMPTY);
            } catch (FileNotFoundException e) {
                log.error("获取全局配置异常 {}", key);
            }
        }
        return value;
    }

    /**
     * 获取项目名称
     */
    public static String getName() {
        return StringUtils.nvl(getConfig("project.name"), "lugongqi");
    }

    /**
     * 获取项目版本
     */
    public static String getVersion() {
        return StringUtils.nvl(getConfig("project.version"), "3.0.0");
    }

    /**
     * 获取版权年份
     */
    public static String getCopyrightYear() {
        return StringUtils.nvl(getConfig("project.copyrightYear"), "2018");
    }

    /**
     * 获取ip地址开关
     */
    public static Boolean isAddressEnabled() {
        String value = getConfig("project.addressEnabled");
        return Boolean.TRUE.equals(value);
    }

    /**
     * 获取文件上传路径
     */
    public static String getProfile() {
        return getConfig("project.profile");
    }

    /**
     * 获取头像上传路径
     */
    public static String getAvatarPath() {
        return getConfig("project.profile") + "avatar/";
    }

    /**
     * 获取下载上传路径
     */
    public static String getDownloadPath() {
        return getConfig("project.profile") + "download/";
    }

    /**
     * 获取数据库备份路径
     * @return
     */
    public static String getDbBackupPath(){
        return getConfig("project.profile") + "dbbackup/";
    }
    /**
     * 获取作者
     */
    public static String getAuthor() {
        return StringUtils.nvl(getConfig("gen.author"), "lugongqi");
    }

    /**
     * 生成包路径
     */
    public static String getPackageName() {
        return StringUtils.nvl(getConfig("gen.packageName"), "com.project.project.module");
    }

    /**
     * 是否自动去除表前缀
     */
    public static String getAutoRemovePre() {
        return StringUtils.nvl(getConfig("gen.autoRemovePre"), "true");
    }

    /**
     * 表前缀(类名不会包含表前缀)
     */
    public static String getTablePrefix() {
        return StringUtils.nvl(getConfig("gen.tablePrefix"), "sys_");
    }

    public static Integer getTcpPort(){
        return Integer.parseInt(StringUtils.nvl(getConfig("client.tcpPort"), "8885"));
    }
    public static String getCharacterSet(){
        return StringUtils.nvl(getConfig("client.characterSet"), "GBK");
    }
    public static Integer getMaxConns(){
        return Integer.parseInt(StringUtils.nvl(getConfig("client.maxConns"), "2000"));
    }
}
