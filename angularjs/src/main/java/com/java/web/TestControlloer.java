package com.java.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class TestControlloer {

	@RequestMapping("/test")
	public String test() {
		return "test";
	}
}
