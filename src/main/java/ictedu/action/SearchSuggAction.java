package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.SchoolDAO;
import mybatis.vo.SuggestionVO;

public class SearchSuggAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// [검색]을 눌렀을 때 전달받는 파라미터를 받아서 먼저 저장한다.
		// request.removeAttribute("ar");
		// request.removeAttribute("page");
		SuggestionVO[] ar = null;
		Paging page = null;
		
		String tag = request.getParameter("tag");
		String value = request.getParameter("value");
		
		// 검색을 위한 HashMap을 만든다
		HashMap<String, String> map = new HashMap<String, String>();
		map.put(tag, value);
		
		int cnt = SchoolDAO.reGetTotalRecord(map);
		
		if(cnt > 0) {
			page = new Paging();
			page.setTotalRecord(cnt);
			page.setNowPage(1);
			map.put("begin", String.valueOf(page.getBegin()));
			map.put("end", String.valueOf(page.getEnd()));
			ar = SchoolDAO.searchSugg(map);
		}else {
			
		}
		
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);

		return "Controller?type=suggestionList";
	}

}
