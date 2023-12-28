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
