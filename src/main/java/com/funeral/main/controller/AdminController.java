package com.funeral.main.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.funeral.main.model.Admin;
import com.funeral.main.repository.AdminRepository;
import com.funeral.main.utility.BcryptHashedPassword;

@Controller
public class AdminController {

	@Autowired
	private AdminRepository adminRepository;
	@GetMapping("/admin")
	public String showAdminPage(Model model)
	{
		model.addAttribute("admin", new Admin());
		return "admin";
	}
	
	@GetMapping("/login")
	public String showSuccessPage(@ModelAttribute("admin") Admin admin,RedirectAttributes attributes)
	{
		String page=null;
		Admin adminGetAdmin=adminRepository.findById(1).orElse(null);
		if(admin.getUsername().trim().equals(adminGetAdmin.getUsername()))
		{
			if(BcryptHashedPassword.matches(admin.getPassword().trim(),adminGetAdmin.getPassword()))
			{
				page="Welcome";
			}
		}
		else
		{
			attributes.addFlashAttribute("message","Enter valid username or password.");
			
			return "redirect:/admin";
		}
		
		
			
		
		return page;
	}
}
