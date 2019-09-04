package com.java.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.web.board.Board;

import net.sf.json.JSONObject;

@Service
public class BoardService {
	
	@Autowired
	SqlSession sqlsession;
	
	public int insert(HttpServletRequest req) {
		Board test = new Board();
		
		JSONObject jobj = JSONObject.fromObject(req.getParameter("list"));
		System.out.println("insertdata: "+JSONObject.fromObject(jobj.get("insertdata")));
		
		test.setComment(JSONObject.fromObject(jobj.get("insertdata")).getString("txt"));
		int result = sqlsession.insert("test.boardinsert", test);
		
		if(result == 1) {
			System.out.println("입력성공");
		}else {
			System.out.println("입력실패");
		}
		
		return result;
	}
	
	public ArrayList<HashMap<String, Object>> select() {
		
		List<Board> resultlist =sqlsession.selectList("test.boardselect");
		ArrayList<HashMap<String, Object>> returndata = new ArrayList<HashMap<String,Object>>();
		for(int i =0; i< resultlist.size() ; i++) {
			HashMap<String,Object> tmp = new HashMap<String, Object>();
			tmp.put("no", resultlist.get(i).getNo());
			tmp.put("txt", resultlist.get(i).getComment());
			
			returndata.add(tmp);
		}
		
		return returndata;
	}
	
	public int update(HttpServletRequest req) {
		Board data = new Board();
		
		JSONObject jobj = JSONObject.fromObject(req.getParameter("list"));
		System.out.println(jobj.get("no").toString()+"제발와라");
		data.setNo( Integer.parseInt( jobj.get("no").toString()));
		data.setComment((String)jobj.get("txt"));
		int result =sqlsession.update("test.boardupdate", data);
		
		if(result ==1) {
			System.out.println("수정성공");
		}else {
			System.out.println("수정실패");
		}
		return result;
	}
	
	public int delete(HttpServletRequest req) {
		Board data = new Board();
		
		JSONObject jobj = JSONObject.fromObject(req.getParameter("list"));
		System.out.println(jobj.get("no").toString()+"제발와라");
		data.setNo( Integer.parseInt( jobj.get("no").toString()));
		int result =sqlsession.update("test.boarddelete", data);
		
		if(result ==1) {
			System.out.println("삭제성공");
		}else {
			System.out.println("삭제실패");
		}
		return result;
	}
	
}
