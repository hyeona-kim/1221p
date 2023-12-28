package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.BoardDAO;
import mybatis.dao.SchoolDAO;
import mybatis.vo.BoardVO;
import mybatis.vo.SuggestionVO;

public class BoardListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		return "/jsp/admin/schoolRecord/boardList.jsp";
	}

}

