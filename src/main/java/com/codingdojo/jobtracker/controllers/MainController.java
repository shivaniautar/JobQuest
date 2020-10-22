package com.codingdojo.jobtracker.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
        	return "redirect:/jobtracker";
        }
    }
    
    @RequestMapping(value="/login", method=RequestMethod.POST)
    public String loginUser(@RequestParam("email") String email, @RequestParam("password") String password, Model model, HttpSession session, @ModelAttribute("user") User user) {
    	if(userService.authenticateUser(email, password)) {
    		// successful
    		User thisUser = userService.findByEmail(email);
    		session.setAttribute("userId", thisUser.getId());
    		session.setAttribute("user", thisUser);
    		return "redirect:/jobtracker";
    	}
        // failure
    	model.addAttribute("error", "Invalid login");
    	return "loginReg.jsp";
    }
    
    
    @RequestMapping("/jobtracker")
    public String home(HttpSession session, Model model, RedirectAttributes flash) {
    	Long userId = (Long) session.getAttribute("userId");
    	// IF USER NOT IN SESSION, BOOT THEM OUT AND REDIRECT THEM TO LOGIN PAGE WITH ERROR
    	if(userId == null) {
    		flash.addFlashAttribute("error", "You must be logged in to view that page!");
    		return "redirect:/login";
    	}
    	// IF SUCCESSFULY LOGGED IN THEN GIVE ACCESS AND SHOW THE DASHBOARD PAGE
//    	User u = userService.findUserById(userId);
//    	List<Show> shows = showService.findAll();
//    	model.addAttribute("user", u);
//    	model.addAttribute("shows", shows);
    	return "HomePage.jsp";
    }
    
    // LOGOUT
  	@RequestMapping("/logout")
  	public String logout(HttpSession session) {
  		session.invalidate();
  		return "redirect:/";
  	}
    
	//__________SHOW CONTROLLER_______________________________

}
