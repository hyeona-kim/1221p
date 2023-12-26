package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.CourseDAO;
import mybatis.dao.ServeDAO;
import mybatis.vo.CourseVO;

public class CourseAction  implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Paging page = new Paging();
		
		page.setTotalRecord(ServeDAO.getCount());
		
		String cPage = request.getParameter("cPage");
		
		if(cPage == null)
			page.setNowPage(1);
		else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		CourseVO[] ar = CourseDAO.getCourseList();
		
		request.setAttribute("page", page);
		request.setAttribute("ar", ar);
		
		return "/jsp/admin/courseReg/courselog.jsp";
	}

}
