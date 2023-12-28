package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.LmsBean;
import ictedu.util.Paging;
import mybatis.dao.CourseDAO;
import mybatis.vo.CourseTypeVO;
import mybatis.vo.CourseVO;
import mybatis.vo.RoomVO;
import mybatis.vo.StaffVO;

public class SearchCourseAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		request.removeAttribute("page");

		String numPerPage = request.getParameter("num");
		String year = request.getParameter("year");
		String select = request.getParameter("select");
		String value = request.getParameter("value");
		String listSelect = request.getParameter("listSelect");
		String cPage = request.getParameter("cPage");
		 
		Paging page = null;

		if(value == null || value.length()<1) {
			value = null;
		}
		
		if(select == null || select.length()<1) {
			select = null;
		}
		
		if(year == null || year.length()==0) {
			year = null;
		}

		LmsBean bean = new LmsBean();
		
		if(value != null && select.equals("1")) {
			StaffVO vo = bean.searchStaff2(value);
			value = vo.getSf_idx();
		}else if(value != null &&select.equals("2")) {
			CourseTypeVO vo = bean.searchCourseType2(value);
			value = vo.getCt_idx();
		}else if(value != null && select.equals("3")) {
			RoomVO vo = bean.searchRoom2(value);
			value = vo.getR_idx();
		}

		if(numPerPage!=null && numPerPage.length()>0 )
			page = new Paging(Integer.parseInt(numPerPage),5);
		else 
			page = new Paging();

		HashMap<String, String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("select", select);
		map.put("value", value);
		page.setTotalRecord(CourseDAO.getSearchCount(map));

		 
		if(cPage == null) {
	        page.setNowPage(1);
		}else {
	       int nowPage = Integer.parseInt(cPage);
	       page.setNowPage(nowPage);
	    }
		
		map.put("begin", String.valueOf(page.getBegin()));
		map.put("end", String.valueOf(page.getEnd()));
		

		CourseVO[] ar = CourseDAO.SearchCourse(map);
	
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);
		
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
		
		//비동기 통신할 jsp로 보내기
		if(listSelect.equals("1"))
//			return "/jsp/admin/courseReg/searchCourse.jsp";
			return "/jsp/admin/courseReg/courseLog_ajax.jsp";
		else if(listSelect.equals("2"))
			return "/jsp/admin/courseReg/serve_ajax.jsp";
		else if(listSelect.equals("3"))
			return "Controller?type=course&listSelect=2"+listSelect;
		else
			return "/jsp/admin/courseReg/courseLog_ajax.jsp";
		
	}
	
}
