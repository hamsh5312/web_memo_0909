package com.hamsh.memo.ex;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class HelloController2 {
	@ResponseBody
	@RequestMapping("/memohello")
	public String hellohello() {
		return "helloworld!!";
	}
}
