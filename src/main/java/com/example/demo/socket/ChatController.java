package com.example.demo.socket;

import com.sun.deploy.util.StringUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * Created by xiaojie.Ma on 2018/9/3.
 */
@Controller
public class ChatController {

    @GetMapping("/")
    public String hello() {
        return "chat";
    }

    @GetMapping("/content")
    public String cc(String name, Model model) {
        if(org.springframework.util.StringUtils.isEmpty(name)) {
            name = "匿名";
        }
        model.addAttribute("name",name);
        return "content";
    }

}
