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

public class CourseMainAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		//°¡Àº
		Object obj = request.getAttribute("page");
		Object obj2 = request.getAttribute("ar");
	
		Paging page = null;
		String listSelect = request.getParameter("listSelect");
		
		if(listSelect == null)
			listSelect ="1";
		
		if(obj == null) {
			page =new Paging();
			page.setTotalRecord(CourseDAO.getCount());
			String cPage = request.getParameter("cPage");
			
			if(cPage == null)
				page.setNowPage(1);
			else {
				int nowPage = Integer.parseInt(cPage);
				page.setNowPage(nowPage);
			}
		}else {
			page = (Paging)obj;
		}
		
		CourseVO[] ar = null;
		if(obj2 == null)
			ar = CourseDAO.getCourseList(page.getBegin(),page.getEnd());
		else
			ar = (CourseVO[])obj2;
		
		request.setAttribute("page", page);
		request.setAttribute("ar",ar);
		//////////////////////////////////////////////
		String[] ct_name = null;
		String[] r_name = null;
		String[] sf_name = null;
		
		LmsBean lb = new LmsBean();
		
		if(ar != null) {
			ct_name= new String[ar.length];
			r_name= new String[ar.length];
			sf_name= new String[ar.length];
			int i = 0;
			for(CourseVO vo :ar) {
				String cName = lb.searchCourseType(vo.getCt_idx()).getCt_name();
				String rName = lb.searchRoom(vo.getR_idx()).getR_name();
				String sName = lb.searchStaff(vo.getT_idx()).getSf_name();
				ct_name[i] = cName;
				r_name[i] = rName;
				sf_name[i] = sName;
				i++;
			}
		}
		
		request.setAttribute("ct_names",ct_name);
		request.setAttribute("r_names",r_name);
		request.setAttribute("sf_names",sf_name);
		
		if(listSelect.equals("1"))
			return "/jsp/admin/courseReg/courseLog_ajax.jsp";
		else if(listSelect.equals("2"))
			return "/jsp/admin/courseReg/serve_ajax.jsp";
		else
			return "/jsp/admin/courseReg/courseLog_ajax.jsp";	
		

	}

}
