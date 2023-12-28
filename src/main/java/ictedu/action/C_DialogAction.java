package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseTypeDAO;
import mybatis.dao.EtcDAO;
import mybatis.dao.RoomDAO;
import mybatis.vo.CourseTypeVO;
import mybatis.vo.RoomVO;
import mybatis.vo.StaffVO;

public class C_DialogAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		Object obj3 = request.getAttribute("c_ar");
		Object obj4 = request.getAttribute("r_ar");
		String select = request.getParameter("select");
		String listSelect = request.getParameter("select");

		CourseTypeVO[] c_ar = null;
		if(obj3 == null)
			c_ar = CourseTypeDAO.getList();
		else
			c_ar = (CourseTypeVO[]) obj3;
		
		request.setAttribute("c_ar", c_ar);
		
		RoomVO[] r_ar = null;
		if(obj4 == null)
			r_ar = RoomDAO.getList();
		else
			r_ar = (RoomVO[])obj4;
		
		request.setAttribute("r_ar", r_ar);
		
		StaffVO[] s_ar = EtcDAO.getList();
		request.setAttribute("s_ar", s_ar);
		
		if(select.equals("addCourse"))
			return "/jsp/admin/courseReg/addCourse_ajax.jsp";
		else if(select.equals("addCourseType"))
			return "/jsp/admin/courseReg/addCourseType_ajax.jsp";
		else if(select.equals("addRoom"))
			return "/jsp/admin/courseReg/addRoom_ajax.jsp";
		else if(select.equals("editCourse"))
			return "/jsp/admin/courseReg/editCourse_ajax.jsp";
		else
			return "Controller?type=course&listSelect="+listSelect;
	}
	
}
