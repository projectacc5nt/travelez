package com.travelez.app.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {
	
	@GetMapping("test.do")
	public String test() {
		return "test";
	}

}
