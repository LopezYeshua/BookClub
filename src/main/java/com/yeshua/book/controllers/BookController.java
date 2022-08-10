package com.yeshua.book.controllers;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yeshua.book.models.Book;
import com.yeshua.book.models.User;
import com.yeshua.book.services.BookServices;
import com.yeshua.book.services.UserServices;

@Controller
@RequestMapping("/books")
public class BookController {
	@Autowired
	UserServices userService;
	
	@Autowired
	BookServices bookService;
	
	@GetMapping("")
	public String dashboard(Model model, HttpSession session, @ModelAttribute("books") ArrayList<Book> books) {
		books.addAll((ArrayList<Book>) bookService.findBooks());
		User user = userService.findUser((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "dashboard.jsp";
	}
	
	@GetMapping("/new")
	public String newBook(@ModelAttribute("book") Book book, Model model, HttpSession session) {
		User user = userService.findUser((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "newBook.jsp";
	}
	
	@PostMapping("/new")
	public String createBook(@Valid @ModelAttribute("book") Book book, BindingResult result) {
		if (result.hasErrors()) {
			return "newBook.jsp";
		}
		bookService.createBook(book);
		return "redirect:/books";
	}
	
	@GetMapping("/show/{id}")
	public String showBook(Model model, @PathVariable(value="id") Long id, HttpSession session) {
		Book book = bookService.findBook(id);
		model.addAttribute("book", book);
		User user = userService.findUser((Long) session.getAttribute("userId"));
		model.addAttribute("user", user);
		return "showBook.jsp";
	}
	
	@GetMapping("/edit/{id}")
	public String editBook(
			Model model,
			@ModelAttribute("book") Book book,
			@PathVariable(value="id") Long id) {
		book = bookService.findBook(id);
		model.addAttribute("book", book);
		return "editBook.jsp";
	}
	
	@PutMapping("/update/{id}")
	public String updateBook(@Valid @ModelAttribute("book") Book book, BindingResult result, @PathVariable(value="id") Long id) {
		if (result.hasErrors()) {
			return ("redirect:/edit/" + id);
		}
		bookService.updateBook(book);
		return "redirect:/books";
	}
}
