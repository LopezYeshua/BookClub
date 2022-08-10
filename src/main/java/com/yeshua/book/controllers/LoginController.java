package com.yeshua.book.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeshua.book.models.LoginUser;
import com.yeshua.book.models.User;
import com.yeshua.book.services.UserServices;

@Controller
@RequestMapping("/login")
public class LoginController {
	
	@Autowired
	private UserServices userService;
	
	@GetMapping("")
	public String index(
			@ModelAttribute("newUser") User newUser,
			@ModelAttribute("loginUser") LoginUser loginUser)
	{
		return "index.jsp";
	}
	
	@PostMapping("/register")
	public String create(
			@Valid @ModelAttribute("newUser") User newUser,
			BindingResult result,
			Model model,
			HttpSession session)
	{
		if (result.hasErrors()) {
			model.addAttribute("loginUser", new LoginUser());
			return "index.jsp";
		} else {
			userService.register(newUser, result);
			User user = userService.findUser(newUser.getId());
			session.setAttribute("userId", user.getId());
			return "redirect:/books";
		}
	}
	
	@PostMapping("")
	public String login(
			@Valid @ModelAttribute("loginUser") LoginUser loginUser,
			BindingResult result,
			Model model,
			HttpSession session)
	{
		User user = userService.login(loginUser, result);
		if (result.hasErrors()) {
			model.addAttribute("newUser", new User());
			return "index.jsp";
		} else {
			session.setAttribute("userId", user.getId());
			return "redirect:/books";
		}
	}
}

