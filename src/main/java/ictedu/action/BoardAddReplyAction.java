package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.BoardDAO;
import mybatis.dao.SchoolDAO;

public class BoardAddReplyAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String subject = request.getParameter("bd_subject");
		String notice = request.getParameter("bd_notice");
		String content = request.getParameter("bd_content");
		String file = request.getParameter("bd_file");
		String writer = request.getParameter("bd_writer");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("bd_subject", subject);
		map.put("bd_notice", notice);
		map.put("bd_content", content);
		map.put("bd_file", file);
		map.put("bd_writer", writer);
		
		BoardDAO.addReply(map);
		
		return "Controller?type=boardList";
	}

}
