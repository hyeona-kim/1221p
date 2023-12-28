package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.SchoolDAO;

public class AddSuggestionAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String subject = request.getParameter("sg_subject");
		String notice = request.getParameter("sg_notice");
		String content = request.getParameter("sg_content");
		
		String file = request.getParameter("sg_file");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sg_subject", subject);
		map.put("notice", notice);
		map.put("sg_content", content);
	
		map.put("sg_file", file);
		
		SchoolDAO.addSuggestion(map);
		return "Controller?type=suggestionList";
		
	}

}
