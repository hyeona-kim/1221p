package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.SchoolDAO;

public class AddSuggestionAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// [학적부 -> 고충 및 건의사항 -> 글쓰기 -> 등록] 버튼을 눌렀을 때 수행
		// add_ajax에서 전달되는 파라미터 값들을 먼저 받아서 저장한다.
		String subject = request.getParameter("sg_subject");
		String notice = request.getParameter("sg_notice");
		String content = request.getParameter("sg_content");
		// [수정필요]
		// file은 enc_type을 이용해서 가져오고 저장해야함 
		String file = request.getParameter("sg_file");
		
		// 전달받은 파라미터 값들을 HashMap에 저장한다.
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sg_subject", subject);
		map.put("notice", notice);
		map.put("sg_content", content);
		// [수정필요]
		// file부분 저장하는거 확인해서 수정해야함
		map.put("sg_file", file);
		
		SchoolDAO.addSuggestion(map);
		return "Controller?type=suggestionList";
		
	}

}
