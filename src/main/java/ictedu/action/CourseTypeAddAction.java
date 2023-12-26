package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseTypeDAO;

public class CourseTypeAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String ct_idx = request.getParameter("ct_idx");
		String ct_name = request.getParameter("ct_name");
		String ct_color = request.getParameter("ct_color");
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("ct_idx", ct_idx);
		map.put("ct_name", ct_name);
		map.put("ct_color", ct_color);
		
		CourseTypeDAO.addType(map);
		
		return "Controller?type=course";
	}

}
