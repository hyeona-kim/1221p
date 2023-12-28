package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.BoardDAO;
import mybatis.dao.SchoolDAO;
import mybatis.vo.BoardVO;

public class BoardListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Paging page = new Paging();
		
		page.setTotalRecord(BoardDAO.getTotalRecord());
		
		String cPage = request.getParameter("cPage");
		
		if(cPage == null)
			page.setNowPage(1);
		else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		
		BoardVO[] ar = BoardDAO.getBoardList(page.getBegin(), page.getEnd());
		
		request.setAttribute("page", page);
		request.setAttribute("ar", ar);
		
		return "/jsp/admin/schoolRecord/boardList.jsp";
	}

}
