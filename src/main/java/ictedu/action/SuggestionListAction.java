package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.SchoolDAO;
import mybatis.dao.TrainingDAO;
import mybatis.vo.SuggestionVO;

public class SuggestionListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		
		return "/jsp/admin/schoolRecord/suggestionList.jsp";
	}

}
