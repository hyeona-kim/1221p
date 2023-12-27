package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EtcDAO;

public class AddStaffAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// [기타관리 -> 교직원등록 -> 저장] 버튼을 눌렀을 때 수행하는 곳
		// add_ajax에서 전달되는 파라미터 값들을 먼저 받아서 저장한다.
		// 인증을 하는 경우 
		String name = request.getParameter("sf_name");
		String job = request.getParameter("sf_job");
		String id = request.getParameter("sf_id");
		String pwd = request.getParameter("sf_pwd");
		String hire_date = request.getParameter("sf_hire_date");
		String fire_date = request.getParameter("sf_fire_date");
		String[] ar = request.getParameterValues("sf_phone");
		String rt_idx = request.getParameter("rt_idx");
		
		// String형으로 key를 저장하기 위해 ar의 값들을 
		// String에 따로 저장해준다.
		String phone = ar[0]+"-"+ar[1]+"-"+ar[2];
		
		// 전달받은 파라미터 값들을 HashMap에 저장한다.
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("sf_name", name);
		map.put("sf_job", job);
		map.put("sf_id", id);
		map.put("sf_pwd", pwd);
		map.put("sf_hire_date", hire_date);
		map.put("sf_fire_date", fire_date);
		map.put("sf_phone", phone);
		map.put("rt_idx", rt_idx);
		
		EtcDAO.addStaff(map);
		
		return "Controller?type=staffList";
		
	}

}
