package com.yuan.web.controller.modules;

import com.yuan.common.echars.Echars;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping(value = "echarsShow")
public class EcharsAction {

    private String prefix = "modules/matter";

    @RequestMapping(value = "/EcharsShow")
    @ResponseBody
    public List<Echars> findById(Model model) {
        List<Echars> list = new ArrayList<>();
        list.add(new Echars("帽子",50));
        list.add(new Echars("鞋子",126));
        list.add(new Echars("毛衣",75));
        list.add(new Echars("羽绒服",201));
        list.add(new Echars("羊毛衫",172));
        System.err.println(list.toString());

        return list;
    }

    @GetMapping(value = "/echars")
    public String echarts4(Model model){
        System.err.println("========开始");
        return prefix + "/echars";
    }

    @GetMapping(value = "/loop")
    public String loop(Model model){
        System.err.println("========开始");
        return prefix + "/loop";
    }

    @GetMapping(value = "/macarons")
    public String macarons(Model model){
        System.err.println("========开始");
        return prefix + "/macarons";
    }

    @GetMapping(value = "/pie")
    public String pie(Model model){
        System.err.println("========开始");
        return prefix + "/pie";
    }

    @GetMapping(value = "/funnel")
    public String funnel(Model model){
        System.err.println("========funnel");
        return prefix + "/funnel";
    }

}
