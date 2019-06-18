package com.yuan.web.controller.modules;

import com.github.pagehelper.PageInfo;
import com.yuan.common.mail.MyMailService;
import com.yuan.framework.web.page.TableDataInfo;
import org.springframework.stereotype.Controller;
import org.springframework.util.Base64Utils;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.thymeleaf.TemplateEngine;
import org.thymeleaf.context.Context;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

@Controller
@CrossOrigin
@RequestMapping("/mytest")
public class MyTestController {

    @Resource
    MyMailService myMailService;
    @Resource
    TemplateEngine templateEngine;

    public static String UPLOADED_FOLDER = "D://xiaoyuan//temp//";

    @ResponseBody
    @RequestMapping("/username")
    public String userName(String name) {
        return "myname is : " + name;
    }

    @GetMapping
    public String index() {
        return "uploadPage";
    }

    @PostMapping("/uploadOne")
    public String uploadOne(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
        if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("message", "请选择上传文件");
            return "redirect:uploadShow";
        }
        try {
            //获取文件并保存
            byte[] bytes = file.getBytes();
            Path path = Paths.get(UPLOADED_FOLDER + file.getOriginalFilename());
            Files.write(path, bytes);
            redirectAttributes.addFlashAttribute("message", file.getOriginalFilename() + "文件上传完成");
        } catch (IOException e) {
            e.printStackTrace();
        }
        return "redirect:uploadShow";
    }

    @PostMapping("/uploadBase")
    @ResponseBody
    public void upload2(String base64) throws IOException {
        /**
         * BASE64 方式的 格式和名字需要自己控制（如 png 图片编码后前缀就会是 data:image/png;base64,）
         * 上传文件保存的路径
         */
        final File tempFile = new File(UPLOADED_FOLDER + "test.jpg");
        /**
         * 防止有的传了 data:image/png;base64, 有的没传的情况
         */
        String[] d = base64.split("base64,");
        final byte[] bytes = Base64Utils.decodeFromString(d.length > 1 ? d[1] : d[0]);
        FileCopyUtils.copy(bytes, tempFile);
    }

    @GetMapping("uploadShow")
    public String uploadShow() {
        return "uploadShowPage";
    }

    /**
     * my 文件上传
     */
    @ResponseBody
    @RequestMapping("/multiFile")
    public String multiFile(HttpServletRequest request,
                            @RequestParam("file1") MultipartFile[] files1,
                            @RequestParam("file2") MultipartFile[] files2) throws IOException {
        System.out.println(request.getRequestURI());

        /**
         * 第一份内容保存
         */
        for (int i = 0; i < files1.length; i++) {
            File file = new File(UPLOADED_FOLDER + files1[i].getOriginalFilename());
            files1[i].transferTo(file);
            System.out.println(files1[i].getOriginalFilename() + "文件上传完成");
        }

        /**
         * 第二份内容保存
         */
        for (int i = 0; i < files2.length; i++) {
            files2[i].transferTo(new File(UPLOADED_FOLDER + files2[i].getOriginalFilename()));
            System.out.println(files2[i].getOriginalFilename() + "文件上传完成");
        }
        return "successSender";
    }


    @ResponseBody
    @RequestMapping(value = "sendMail")
    public String sendSimpleMail() {
        myMailService.sendSimpleMail("1774328193@qq.com", "这是一份邮件", "Do you want for code ,best yourself");
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "sendAttMail")
    public String sendAttMail() {
        try {
            myMailService.sendAttachmentsHtmlMail("1774328193@qq.com",
                    "这是一份邮件",
                    "Do you want for code ,best yourself",
                    "C:" + File.separator + "Users" + File.separator + "Administrator" + File.separator + "Desktop" + File.separator + "MyStory" + File.separator + "pom.xml");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "sendTempleHtmlMail")
    public String sendTempleHtmlMail() {
        try {
            Context context = new Context();
            context.setVariable("id", "15");
            String content = templateEngine.process("modules/mail/simple", context);
            myMailService.sendHtmlMail("1774328193@qq.com", "这是一份邮件", content);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    @ResponseBody
    @RequestMapping(value = "sendImgMail")
    public String sendImgMail() {
        try {
            String imgPath = "D:" + File.separator + "1.png";
            String rscId = "0123";
            String content = "<thml><body>这是图片：" +
                    "<img src=\'cid:" + rscId + "\'></img></body></thml>";

            myMailService.sendImgMail("1774328193@qq.com", "这是一份邮件",
                    content, imgPath, rscId);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "success";
    }

    protected TableDataInfo getDataTable(List<?> list) {
        TableDataInfo rspData = new TableDataInfo();
        rspData.setCode(0);
        rspData.setRows(list);
        rspData.setTotal(new PageInfo(list).getTotal());
        return rspData;
    }

    @GetMapping(value = "get")
    @ResponseBody
    public String testGet() {
        return "hello get";
    }

    @GetMapping(value = "post")
    @ResponseBody
    public String testPost() {
        return "hello post";
    }

}
