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
		
		if(cPage == null)
			page.setNowPage(1);
		else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		
		if(obj_ar == null) {
			ar = BoardDAO.getBoardList(page.getBegin(), page.getEnd());
		}else {
			ar = (BoardVO[])obj_ar;
			System.out.println("========================");
			System.out.println("ar.length: "+ar.length);
		}
		
		System.out.println("========================");
		System.out.println("length: "+ar.length);
		System.out.println("totalrecord: "+page.getTotalRecord());
		System.out.println("begin: "+page.getBegin());
		System.out.println("end: "+page.getEnd());
		
		
		
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);
		
		return "/jsp/admin/schoolRecord/boardList.jsp";
	}

}

