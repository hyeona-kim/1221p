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
		
		return "Controller?type=course&listSelect="+listSelect;
	}
	
}
