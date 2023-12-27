package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.CourseDAO;
import mybatis.dao.CourseTypeDAO;
import mybatis.vo.CourseTypeVO;
import mybatis.vo.CourseVO;

public class CourseAction  implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Object obj = request.getAttribute("page");
		Object obj2 = request.getAttribute("ar");
		Object obj3 = request.getAttribute("c_ar");
		Paging page = null;
		String listSelect = request.getParameter("listSelect");
		if(obj == null)
			page =new Paging();
		else
			page = (Paging)obj;
		
		page.setTotalRecord(CourseDAO.getCount());
		
		String cPage = request.getParameter("cPage");
		
		if(cPage == null)
			page.setNowPage(1);
		else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
		}
		CourseVO[] ar = null;
		if(obj2 == null)
			ar = CourseDAO.getCourseList(page.getBegin(),page.getEnd());
		else
			ar = (CourseVO[])obj2;
		
		request.setAttribute("page", page);
		request.setAttribute("ar", ar);
		
		CourseTypeVO[] c_ar = null;
		if(obj3 == null)
			c_ar = CourseTypeDAO.getList();
		else
			c_ar = (CourseTypeVO[]) obj3;
		
		request.setAttribute("c_ar", c_ar);
		
		if(listSelect.equals("1"))
			return "/jsp/admin/courseReg/courselog.jsp";
		else if(listSelect.equals("2"))
			return "/jsp/admin/courseReg/serve.jsp";
		else
			return "/jsp/admin/courseReg/courselog.jsp";
	}

}
