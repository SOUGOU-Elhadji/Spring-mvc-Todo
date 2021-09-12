package com.sarayaspring.controller;

import java.util.Date;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sarayaspring.model.Todo;
import com.sarayaspring.service.TodoService;


@Controller
@SessionAttributes("username")
public class TodoController {
	@Autowired
	TodoService todoService;
	@Autowired
	WelcomeController welcomeController;
	
	
	@RequestMapping(value = "/list-todo", method=RequestMethod.GET)
	public String getAllTodo(ModelMap model) {
		String username = (String) model.getAttribute("username"); 
		model.addAttribute("todos", todoService.getAllTodos(username));
		return "listPage";
	}
	
	@RequestMapping(value = "/add-todo", method=RequestMethod.GET)
	public String addTodo(ModelMap model) {
		model.addAttribute("todos", new Todo());
		return "formPage";
	}
	
	@RequestMapping(value = "/add-todo", method=RequestMethod.POST)
	public String add(@RequestParam String desc, ModelMap model) {
		todoService.addTodo("malick", desc, new Date(), false);
		return "redirect:/list-todo";
	}
	
	@RequestMapping(value = "/delete-todo", method=RequestMethod.GET)
	public String deleteTodo(@RequestParam int id, ModelMap model) {
		todoService.deleteTodo(id);
		model.clear();
		return "redirect:/list-todo";
	}
	
	@RequestMapping(value = "/update-todo", method=RequestMethod.GET)
	public String updatingTodo(@RequestParam Integer id, ModelMap model) {
		model.addAttribute("todo", todoService.findById(id));
		return "editPage";
	}
	
	@RequestMapping(value = "/update-todo", method=RequestMethod.POST)
	public String updateTodo(@Validated Todo todo, ModelMap model, BindingResult result) {
		if (result.hasErrors())
			return "listPage";
			//todo.setUser();
			todo.setUser(welcomeController.getLoggedInUser());
			todoService.updateTodo(todo);
			model.clear();
			return "redirect:/list-todo";
	}
}
