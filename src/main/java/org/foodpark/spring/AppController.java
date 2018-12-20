package org.foodpark.spring;

import org.foodpark.spring.model.Output;
import org.foodpark.spring.service.OutputService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

@Controller
@RequestMapping("/resource")
public class AppController {
	
	@Autowired
	private RestTemplate restTemplate;
	
	@Autowired
	private OutputService outputService;

	@RequestMapping(value = "/package_list", method = RequestMethod.GET)
	@ResponseBody
	public String getPackageList() {

		String response = restTemplate.getForObject("https://www.fsis.usda.gov/shared/data/EN/foodkeeper.json",	String.class);

		System.out.println(response);

		return response;
	}
	
	
	@RequestMapping(value = "/all/package_list", method = RequestMethod.GET)
	@ResponseBody
	public Output getAllPackageList() {

		return outputService.getAllPackageList();
	}

}
