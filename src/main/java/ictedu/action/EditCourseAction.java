package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseDAO;
import mybatis.vo.CourseVO;

public class EditCourseAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
          String c_idx = request.getParameter("c_idx");
          String edit = request.getParameter("edit");
         if(edit == null) {
          CourseVO vo = CourseDAO.getCourse(c_idx);
          request.setAttribute("edit_cvo", vo);
          return "/jsp/admin/courseReg/editCourse_ajax.jsp";
         }else{
	        String c_name = request.getParameter("c_name");
	  		String start_date = request.getParameter("start_date");
	  		String end_date = request.getParameter("end_date");
	  		String course_fee = request.getParameter("course_fee");
	  		String c_peo_num = request.getParameter("c_peo_num");
	  		String c_round_num = request.getParameter("c_round_num");
	  		
	  		CourseDAO.edit(c_idx, c_name, start_date, end_date, course_fee, c_peo_num, c_round_num);
  			return "Controller?type=course&listSelect=1&cPage=1";
        }
       
	}

}
