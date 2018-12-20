package org.foodpark.spring.controller;

import java.util.List;

import org.foodpark.spring.model.Version;
import org.foodpark.spring.service.VersionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/version")
public class VersionController {

	@Autowired
	private VersionService versionService;
	
	@RequestMapping(value = "/save", method = RequestMethod.POST)
    @ResponseBody
    public Version saveVersion(@RequestBody Version version) {

        return versionService.saveVersion(version);
    }
	
	@RequestMapping(value = "/update", method = RequestMethod.PUT)
    @ResponseBody
    public Version updateVersion(@RequestBody Version version) {

        return versionService.updateVersion(version);
    }
	
	@RequestMapping(value = "/get", method = RequestMethod.GET)
    @ResponseBody
    public List<Version> getAllVersion() {

        return versionService.getAllVersion();
    }
	
	@RequestMapping(value = "/get/{id}", method = RequestMethod.GET)
    @ResponseBody
    public Version getVersionById(@PathVariable Integer id) {

        return versionService.getVersionById(id);
    }
	
	@RequestMapping(value = "/get/currentVersion/{currentVersion}", method = RequestMethod.GET)
    @ResponseBody
    public List<Version> getVersionByCurrentVersion(@PathVariable String currentVersion) {

        return versionService.getVersionByCurrentVersion(currentVersion);
    }
	
	@RequestMapping(value = "/get/by/search", method = RequestMethod.GET)
    @ResponseBody
    public List<Version> getVersionBySearch(String modifiedDate, String approvedDate) {

        return versionService.getVersionBySearch(modifiedDate, approvedDate);
    }
}
