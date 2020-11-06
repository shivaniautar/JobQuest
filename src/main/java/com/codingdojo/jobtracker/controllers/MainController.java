package com.codingdojo.jobtracker.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.codingdojo.jobtracker.models.Jobapp;
import com.codingdojo.jobtracker.models.User;
import com.codingdojo.jobtracker.services.JobappService;
import com.codingdojo.jobtracker.services.UserService;
import com.codingdojo.jobtracker.validators.UserValidator;


@Controller
public class MainController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	JobappService jobappService;
	
	@Autowired
	UserValidator userValidator;
	
	//__________USER CONTROLLER_______________________________
	
	@RequestMapping("")
    public String loginReg(@ModelAttribute("user") User user) {
        return "loginReg.jsp";
    }
	 @RequestMapping("/login")
	    public String login() {
	        return "loginPage.jsp";
	    }
    
    @RequestMapping(value="/registration", method=RequestMethod.POST)
    public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session) {
    	userValidator.validate(user, result);
    	if(result.hasErrors()){
    		return "loginReg.jsp";
        }
        else {
        	User newUser=userService.registerUser(user);
        	session.setAttribute("userId", newUser.getId());
        	session.setAttribute("user", newUser);
        	return "redirect:/job-quest";
        }
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, @ModelAttribute("user") User user) {
    	if(userService.authenticateUser(email, password)) {
    		// successful
    		User thisUser = userService.findByEmail(email);
    		session.setAttribute("userId", thisUser.getId());
    		session.setAttribute("user", thisUser);
    		return "redirect:/job-quest";
    	}
        // failure
    	model.addAttribute("error", "Invalid login");
    	return "loginReg.jsp";
    }
    
    
    @RequestMapping("/job-quest")
    public String home(HttpSession session, Model model, RedirectAttributes flash) {
    	Long userId = (Long) session.getAttribute("userId");
    	// IF USER NOT IN SESSION, BOOT THEM OUT AND REDIRECT THEM TO LOGIN PAGE WITH ERROR
    	if(userId == null) {
    		flash.addFlashAttribute("error", "You must be logged in to view that page!");
    		return "redirect:/login";
    	}
    	// IF SUCCESSFULY LOGGED IN THEN GIVE ACCESS AND SHOW THE DASHBOARD PAGE
    	User u = userService.findUserById(userId);
    	List<Jobapp> job = jobappService.allByUser(u);
//    	List<Jobapp> job = jobappService.findAll();
    	model.addAttribute("user", u );
    	model.addAttribute("jobs", job);
    	return "HomePage.jsp";
    }
    
    // LOGOUT
  	@RequestMapping("/logout")
  	public String logout(HttpSession session) {
  		session.invalidate();
  		return "redirect:/";
  	}
    
	//__________JOBAPP CONTROLLER_______________________________

  	
  	@RequestMapping("/new/jobapplication")
    public String newjobapp(HttpSession session, Model model, @ModelAttribute("jobapp") Jobapp jobapp, RedirectAttributes flash) {
    	Long userId = (Long) session.getAttribute("userId");
    	// IF USER NOT IN SESSION, BOOT THEM OUT AND REDIRECT THEM TO LOGIN PAGE WITH ERROR
    	if(userId == null) {
    		flash.addFlashAttribute("error", "You must be logged in to view that page!");
    		return "redirect:/login";
    	}
    	return "NewJobappPage.jsp";
    }

	// <--------- POST REQUEST TO ADD A NEW JOB APPLICATION ---------->
	@PostMapping("/newjobapp/process")
	public String createJobapp(@Valid @ModelAttribute("jobapp") Jobapp jobapp, BindingResult result, HttpSession session, RedirectAttributes flash) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			flash.addFlashAttribute("error", "You must be logged in to view that page!");
			return "redirect:/";
		}
		if(result.hasErrors()) {
			return "NewJobappPage.jsp";
		} else {
			jobappService.createJobapp(jobapp);
			return "redirect:/job-quest";
		}
	}
  	
	// <--------- SHOW A SPECIFIC JOB APPLICATION PAGE---------->
	
	@RequestMapping("/jobapplication/{id}")
	public String showJobapppage(Model model, @PathVariable("id") Long id, HttpSession session, RedirectAttributes flash, @Valid @ModelAttribute("jobapp") Jobapp jobapp, BindingResult result) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			flash.addFlashAttribute("error", "You must be logged in to view that page!");
			return "redirect:/";
		}
		model.addAttribute("j", jobappService.findById(id));
		User u = userService.findUserById(userId);
		model.addAttribute("user", u);
		return "ShowJobappPage.jsp";
	}
	
	// <---------- DELETE REQUEST TO DELETE A SHOW ---------->
    @RequestMapping(value="/jobapplication/{id}/delete", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id, HttpSession session, RedirectAttributes flash) {
    	Long userId = (Long) session.getAttribute("userId");
    	if(userId == null) {
    		flash.addFlashAttribute("error", "You must be logged in to view that page!");
    		return "redirect:/";
    	}
    	jobappService.deleteJobapp(id);
    	return "redirect:/job-quest";
    }
    
	// <--------- DISPLAY PAGE TO EDIT AN APPLICATION ---------->
	@RequestMapping("/jobapplication/{id}/edit")
	public String editJobapppage(Model model, @PathVariable("id") Long id, HttpSession session, RedirectAttributes flash) {
		Jobapp jobapp = jobappService.findById(id);
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			flash.addFlashAttribute("error", "You must be logged in to view that page!");
			return "redirect:/";
		} 
		model.addAttribute("jobapp", jobapp);
		return "EditJobappPage.jsp";
	}
	
	// <<--------- POST REQUEST TO UPDATE A SHOW ---------->
	@RequestMapping("/editjobapp/{id}/process")
	public String updateJobapp(@Valid @ModelAttribute("jobapp") Jobapp jobapp, BindingResult result, @PathVariable("id") Long id, HttpSession session, RedirectAttributes flash) {
		Long userId = (Long) session.getAttribute("userId");
		if(userId == null) {
			flash.addFlashAttribute("error", "You must be logged in to view that page!");
			return "redirect:/";
		}
		
		if(result.hasErrors()) {
			return "EditJobappPage.jsp";
		} else {
			jobappService.updateJobapp(jobapp);
			return String.format("redirect:/jobapplication/%d", id);
		}
	}
	
	
	@RequestMapping("/status/stats")
    public String statusStats(HttpSession session, Model model, RedirectAttributes flash) {
    	Long userId = (Long) session.getAttribute("userId");
    	// IF USER NOT IN SESSION, BOOT THEM OUT AND REDIRECT THEM TO LOGIN PAGE WITH ERROR
    	if(userId == null) {
    		flash.addFlashAttribute("error", "You must be logged in to view that page!");
    		return "redirect:/login";
    	}
    	// IF SUCCESSFULY LOGGED IN THEN GIVE ACCESS AND SHOW THE DASHBOARD PAGE
    	User u = userService.findUserById(userId);
    	List<Jobapp> job = jobappService.allByUser(u);
//    	List<Jobapp> job = jobappService.findAll();
    	List<Jobapp> status = jobappService.allByUserAndStatus(u, "Applied");
    	List<Jobapp> needtoapply = jobappService.allByUserAndStatus(u, "Need To Apply");
    	model.addAttribute("need", needtoapply);
    	model.addAttribute("stat", status);
    	model.addAttribute("user", u );
    	model.addAttribute("jobs", job);
    	return "StatsPage.jsp";
    }
	
}
