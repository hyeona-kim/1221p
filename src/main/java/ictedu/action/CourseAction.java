package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseDAO;
import mybatis.vo.CourseVO;

public class CourseAction  implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		CourseVO[] ar = CourseDAO.getCourseList();
		
		request.setAttribute("courseList", ar);
		
		return "courselog.jsp";
	}

}
