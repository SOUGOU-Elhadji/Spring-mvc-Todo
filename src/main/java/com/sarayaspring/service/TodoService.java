package com.sarayaspring.service;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sarayaspring.model.Todo;

@Service
@SessionAttributes("username")
public class TodoService {
	public static List<Todo> todos = new ArrayList<Todo>();
	static int count = 6;
	static {
		todos.add(new Todo(1, "Malick", "Sougou", new Date(), true));
		todos.add(new Todo(2, "Malick", "Sougou", new Date(), true));
		todos.add(new Todo(3, "Malick", "Sougou", new Date(), true));
		todos.add(new Todo(4, "Malick", "Sougou", new Date(), true));
		todos.add(new Todo(5, "Malick", "Sougou", new Date(), true));
		todos.add(new Todo(6, "Malick", "Sougou", new Date(), false));
	}
	public List<Todo> getAllTodos(String user) {
		// TODO Auto-generated method stub
		List<Todo> listTodos = new ArrayList<Todo>();
		for (Todo todo : listTodos) {
			if (todo.getUser().equalsIgnoreCase(user)) {
				listTodos.add(todo);
			}
		}
		return todos;
	}
	
	public void addTodo(String user, String desc, Date targetDate, boolean isDone) {
		// TODO Auto-generated method stub
		todos.add(new Todo(++count, user, desc, targetDate, isDone));
	}
	
	public Todo findById(int id) {
		for (Todo todo : todos) {
			if (todo.getId() == id) {
				return todo;
			}
		}
		return null;
	}
	
	public void updateTodo(Todo todo) {
		todos.remove(todo);
		todos.add(todo);
	}
	
	public void deleteTodo(int id) {
		// TODO Auto-generated method stub
		Iterator<Todo> iterator = todos.iterator();
		while (iterator.hasNext()) {
			Todo todo = iterator.next();
			if (todo.getId() == id) {
				iterator.remove();
			}
		}
	}
	
	
}
