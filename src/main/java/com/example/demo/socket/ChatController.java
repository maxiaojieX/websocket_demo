package com.example.demo.socket;

import org.springframework.stereotype.Controller;
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

}
