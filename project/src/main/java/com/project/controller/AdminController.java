package com.project.controller;

import java.io.File;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.domain.RestaurantVO;
import com.project.service.AdminService;

import lombok.extern.log4j.Log4j;
@Controller
@RequestMapping("/admin/*")
@Log4j
public class AdminController {
	
	@Autowired
	private AdminService service;
	
	@GetMapping("restaurantAdd")
	@PreAuthorize("isAuthenticated()")
	public void restaurantAdd() {
		
	}
	@PostMapping("restaurantAdd")
	@PreAuthorize("isAuthenticated()")
	public String restaurantAddPro(RestaurantVO rest, RedirectAttributes rttr,
			MultipartHttpServletRequest request) {
		
		try {
			
			MultipartFile mf = request.getFile("res_menuu");
			request.getFiles("res_menuu");
			String path = request.getRealPath("/resources/save");
			String uuid = UUID.randomUUID().toString().replaceAll("-", "");
			String orgName = mf.getOriginalFilename();
			String ext = orgName.substring(orgName.lastIndexOf("."));
			String newFileName = uuid + ext;
			String imgPath = path + "\\" + newFileName;
			
			File copyFile = new File(imgPath);
			mf.transferTo(copyFile);
			rest.setRes_menu(newFileName);
			log.info(rest.getRes_name());
			log.info(rest.getRes_img1());
			log.info(rest.getRes_img2());
			log.info("!!!!!!!!!!!!!!img1!!!!!!!!!!"+(request.getFile("res_img01")).toString());
			log.info("!!!!!!!!!!!!!!img2!!!!!!!!!!"+(request.getFile("res_img02")).toString());
			for(int i = 1; i <=3; i++) {
				mf = request.getFile("res_img0"+i);
				log.info("!!!!!!!!!mf = "+mf.getName());
				boolean a = request.getFile("res_img0"+i) == null;
				boolean b = request.getFile("res_img0"+i).equals("");
				log.info("!!!!!!!!!a = "+a);
				log.info(b);
				if(mf != null) {
					mf = null; path=null; uuid=null; orgName=null; ext=null; newFileName=null; imgPath=null; copyFile=null;
					mf = request.getFile("res_img0"+i);
					request.getFiles("res_img0"+i);
					path = request.getRealPath("/resources/save");
					uuid = UUID.randomUUID().toString().replaceAll("-", "");
					orgName = mf.getOriginalFilename();
					ext = orgName.substring(orgName.lastIndexOf("."));
					newFileName = uuid + ext;
					imgPath = path + "\\" + newFileName;
					
					copyFile = new File(imgPath);
					mf.transferTo(copyFile);
					if(i == 1) {
						rest.setRes_img1(newFileName);
					}else if(i == 2) {
						rest.setRes_img2(newFileName);
					}else if(i == 3) {
						rest.setRes_img3(newFileName);
					}
				}
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
		
		service.restaurantAdd(rest);
		
		rttr.addFlashAttribute("result", rest.getRes_no());
		
		return "redirect:/content/restaurantAdd";
	}
}
