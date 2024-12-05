package com.java.glowamber.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

	@RequestMapping("/{category}/{url}")
	public String Start(@PathVariable String category, @PathVariable String url) {
		System.out.println("url:" + category+"/"+url);
		return category+"/"+url;
	}
}


