package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseDAO;
import mybatis.vo.CourseVO;

public class CourseAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// 파라미터들 받기
		String c_name = request.getParameter("c_name");
		String start_date = request.getParameter("start_date");
		String end_date = request.getParameter("end_date");
		String course_fee = request.getParameter("course_fee");
		String c_peo_num = request.getParameter("c_peo_num");
		String c_round_num = request.getParameter("c_round_num");
		
		//받은 객체들을 vo로 지정
		CourseVO cvo = new CourseVO();
		cvo.setC_name(c_name);
		cvo.setStart_date(start_date);
		cvo.setEnd_date(end_date);
		cvo.setCourse_fee(course_fee);
		cvo.setC_peo_num(c_peo_num);
		cvo.setC_round_num(c_round_num);
		
		int cnt = CourseDAO.add(c_name, start_date, end_date,course_fee, c_peo_num, c_round_num); //댓글저장!
		
		// 원래 있었던 보기화면으로 가야한다.
		return "Controller?type=course&";
	}

}
