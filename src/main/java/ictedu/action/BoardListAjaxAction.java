package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.BoardDAO;
import mybatis.vo.BoardVO;

public class BoardListAjaxAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		BoardVO[] ar = null;
		Paging page = null;
		
		Object obj_ar = request.getAttribute("ar");
		Object obj_p = request.getAttribute("page");
		
		if(obj_p == null) {
			page = new Paging();
			page.setTotalRecord(BoardDAO.getTotalRecord());
		}else {
			page = (Paging)obj_p;
		}
		
		String cPage = request.getParameter("cPage");
		
		if(cPage == null || cPage.equalsIgnoreCase("undefined"))
			page.setNowPage(1);
		else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		
		if(obj_ar == null) {
			ar = BoardDAO.getBoardList(page.getBegin(), page.getEnd());
		}else {
			ar = (BoardVO[])obj_ar;
			
		}
		
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);
		
		return "/jsp/admin/schoolRecord/boardList_ajax.jsp";
	}

}
