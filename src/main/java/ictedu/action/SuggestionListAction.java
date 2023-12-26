package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.SchoolDAO;
import mybatis.dao.TrainingDAO;
import mybatis.vo.SuggestionVO;

public class SuggestionListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		SuggestionVO[] ar = SchoolDAO.getSuggList();
		
		request.setAttribute("ar", ar);
		
		return "/jsp/admin/schoolRecord/suggestionList.jsp";
	}

}
