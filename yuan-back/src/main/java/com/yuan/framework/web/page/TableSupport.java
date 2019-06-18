package com.yuan.framework.web.page;

import com.yuan.common.constant.Constants;
import com.yuan.common.support.Convert;
import com.yuan.framework.util.ServletUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * 表格数据处理
 *
 * @author lws
 */
public class TableSupport {
    /**
     * 封装分页对象
     */
    public static PageDomain getPageDomain() {
        PageDomain pageDomain = new PageDomain();
        HttpServletRequest request = ServletUtils.getRequest();
        pageDomain.setPageNum(Convert.toInt(request.getParameter(Constants.PAGE_NUM)));
        pageDomain.setPageSize(Convert.toInt(request.getParameter(Constants.PAGE_SIZE)));
        pageDomain.setOrderByColumn(request.getParameter(Constants.ORDER_BY_COLUMN));
        pageDomain.setIsAsc(request.getParameter(Constants.IS_ASC));
        return pageDomain;
    }

    public static PageDomain buildPageRequest() {
        return getPageDomain();
    }
}
