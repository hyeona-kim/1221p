package ictedu.action;

import java.util.HashMap;
import java.util.HashSet;

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
		String code = null;
		// String형으로 key를 저장하기 위해 ar의 값들을 
		// String에 따로 저장해준다.
		String phone = ar[0]+"-"+ar[1]+"-"+ar[2];
		
		// 만약 사용권한(rt_idx)이 1이면 교수이므로
		// 교수코드(sf_code)를 생성해서 map에 저장한다.
		if(Integer.parseInt(rt_idx) == 1) {
			/*
			 * int num = (int)Math.floor(Math.random()*999999); code = String.valueOf(num);
			 */
			
			// 비교를 위해 DB에서 교수코드(sf_code)들을 가져온다
			String[] s_ar = EtcDAO.searchSfCode();
			
			// 중복 확인을 위해 set를 생성한다.
			HashSet<String> set = new HashSet<String>();
			
			// DB에서 가져온 교수코드(sf_code) 값들을 set에 저장한다
			for(int i=0; i<s_ar.length; i++) {
				set.add(s_ar[i]);
			}
			
			// set에 새로 생성한 code값이 없을때까지 반복수행한다
			int num;
			while(!set.contains(code)) {
				num = (int)Math.floor(Math.random()*999999);
				code = String.valueOf(num);
			}
		}
		
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
		map.put("sf_code", "tc"+code);
		
		EtcDAO.addStaff(map);
		
		return "Controller?type=staffList";
		
	}

}
