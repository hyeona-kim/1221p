package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseDAO;

public class DelCourseAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// c_idx값을 파라미터로 받는다
		String c_idx = request.getParameter("c_idx");
		
		int cnt = CourseDAO.del(c_idx);

		return "Controller?type=course";
	}

}
