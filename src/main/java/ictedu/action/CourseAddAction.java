package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseDAO;
import mybatis.dao.EtcDAO;
import mybatis.vo.CourseVO;

public class CourseAddAction implements Action {
	

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
	
		String c_name = request.getParameter("c_name");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String course_fee = request.getParameter("course_fee");
		String c_peo_num = request.getParameter("c_peo_num");
		String c_round_num = request.getParameter("c_round_num");
		String listSelect = request.getParameter("listSelect");
		String ct_idx = request.getParameter("ct_select");
		String sf_idx = request.getParameter("sf_select");
		
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("c_name", c_name);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("course_fee", course_fee);
		map.put("c_peo_num", c_peo_num);
		map.put("c_round_num", c_round_num);
		map.put("ct_idx", ct_idx);
		map.put("t_idx", sf_idx);
		
		CourseDAO.addCourse(map);
		
		return "Controller?type=course&listSelect="+listSelect;
	}

}
