package com.yuan.web.controller.tool;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yuan.common.base.AjaxResult;
import com.yuan.web.core.base.BaseController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiImplicitParam;
import io.swagger.annotations.ApiOperation;

/**
 * swagger 测试方法
 *
 * @author lws
 */
@Api("用户信息管理")
@RestController
@RequestMapping("/test/*")
public class TestController extends BaseController {
    private final static List<Test> testList = new ArrayList<>();

    {
        testList.add(new Test("1", "admin", "admin123"));
        testList.add(new Test("2", "ry", "admin123"));
    }

    @ApiOperation("获取列表")
    @GetMapping("list")
    public List<Test> testList() {
        return testList;
    }

    @ApiOperation("新增用户")
    @PostMapping("save")
    public AjaxResult save(Test test) {
        return testList.add(test) ? success() : error();
    }

    @ApiOperation("更新用户")
    @ApiImplicitParam(name = "Test", value = "单个用户信息", dataType = "Test")
    @PutMapping("update")
    public AjaxResult update(Test test) {
        return testList.remove(test) && testList.add(test) ? success() : error();
    }

    @ApiOperation("删除用户")
    @ApiImplicitParam(name = "Tests", value = "单个用户信息", dataType = "Test")
    @DeleteMapping("delete")
    public AjaxResult delete(Test test) {
        return testList.remove(test) ? success() : error();
    }

}

