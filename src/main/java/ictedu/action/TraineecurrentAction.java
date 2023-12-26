package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.TraineecurrentDAO;
import mybatis.vo.CourseVO;

public class TraineecurrentAction implements Action{
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Paging page = new Paging();
		
		page.setTotalPage(TraineecurrentDAO.getCount());
		
		String cPage = request.getParameter("cPage");
		
		if(cPage == null)
			page.setNowPage(1);
		else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
			
		}
		
		CourseVO[] ar = TraineecurrentDAO.getlist(page.getBegin(), page.getEnd());
		
		request.setAttribute("page", page);
		request.setAttribute("ar", ar);
		
		return "jsp/admin/schoolRecord/TraineeCurrent.jsp";
		
		
		
		
	}

}
