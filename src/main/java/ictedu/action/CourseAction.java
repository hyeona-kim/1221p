package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.LmsBean;
import ictedu.util.Paging;
import mybatis.dao.CourseDAO;
import mybatis.dao.CourseTypeDAO;
import mybatis.dao.EtcDAO;
import mybatis.dao.RoomDAO;
import mybatis.vo.CourseTypeVO;
import mybatis.vo.CourseVO;
import mybatis.vo.RoomVO;
import mybatis.vo.StaffVO;

public class CourseAction  implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String listSelect = request.getParameter("listSelect");
		Object obj3 = request.getAttribute("c_ar");
		Object obj4 = request.getAttribute("r_ar");
		
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
		
		System.out.println(listSelect);
		if(listSelect.equals("1"))
			return "/jsp/admin/courseReg/courselog.jsp";
		else if(listSelect.equals("2"))
			return "/jsp/admin/courseReg/serve.jsp";
		else if(listSelect.equals("3"))
			return "/jsp/admin/courseReg/maketime.jsp";
		else
			return "/jsp/admin/courseReg/courselog.jsp";	
	}

}
