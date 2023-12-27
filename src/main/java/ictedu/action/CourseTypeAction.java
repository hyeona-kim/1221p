package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseTypeDAO;
import mybatis.vo.CourseTypeVO;


public class CourseTypeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Object obj = request.getAttribute("c_ar");
		String listSelect = request.getParameter("listSelect");
		
		CourseTypeVO[] ar = null;
		if(obj == null)
			ar = CourseTypeDAO.getList();
		else
			ar = (CourseTypeVO[])obj;
		request.setAttribute("c_ar", ar);
		
		if(listSelect.equals("1"))
			return "/jsp/admin/courseReg/courselog.jsp";
		else if(listSelect.equals("2"))
			return "/jsp/admin/courseReg/serve.jsp";
		else
			return "/jsp/admin/courseReg/courselog.jsp";
	}
	

}
