package com.java.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.web.board.Board;
import com.java.web.service.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Autowired
	BoardService bs;
	
	
	@RequestMapping(value = "/exam", method = RequestMethod.GET)
	public String home() {
		return "exam";
	}
	
	@RequestMapping(value="/exam/insert", method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> insert(HttpServletRequest req, HttpServletResponse res)  {
		int resultdata = bs.insert(req); 
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("return_Result", "success");
		return resultMap;
	}
	
	@RequestMapping(value="/exam/select", method=RequestMethod.GET)
	public @ResponseBody ArrayList<Board> select(HttpServletRequest req, HttpServletResponse res) {
		ArrayList result = bs.select();
		return result;
		
	}
	
	@RequestMapping(value="/exam/update", method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> update(HttpServletRequest req, HttpServletResponse res) {
		
		int result = bs.update(req);
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("return_Result", "success");
		return resultMap;
	}
	
	
	@RequestMapping(value="/exam/delete", method=RequestMethod.POST)
	public @ResponseBody HashMap<String,Object> delete(HttpServletRequest req, HttpServletResponse res) {
		
		int result = bs.delete(req);
		
		HashMap<String,Object> resultMap = new HashMap<String,Object>();
		resultMap.put("return_Result", "success");
		return resultMap;
	}
	
	/*
	 * 로그인
	 * */
	
	@RequestMapping(value="/exam/login", method=RequestMethod.POST)
	public @ResponseBody boolean login(HttpServletRequest req, HttpSession session) {
		
		boolean result =bs.login(req, session);
		
		System.out.println("세션 유지?: "+session.getAttribute("id"));
		
		return result;
		
	}
	
	
}
