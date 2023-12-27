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
		// 검색을 해서 가져와서 page와, ar 을 가져와야 한다.
		//만약에 검색창에 공백이 입력됐을때에는 ar에 null을 저장하고 움직 여야한다. 그럼 courseAction에서 ar을 새롭게 받아서 전체를 가져오는 ar로 지정해서 받기 때문이다.
		// page는 page select에 입려되는 value값을 가져오고 
		// selectYear에서의 연도는 개강일의 연도를 뜻한다.
		request.removeAttribute("ar");
		request.removeAttribute("page");

		String numPerPage = request.getParameter("num");
		String year = request.getParameter("year");
		String select = request.getParameter("select");
		String value = request.getParameter("value");
		String listSelect = request.getParameter("listSelect");
		String cPage = request.getParameter("cPage");
		 
		Paging page = null;
		System.out.println(numPerPage);
		
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
		
		System.out.println(select);
		CourseVO[] ar = CourseDAO.searchCourse(map);
	
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);
		
		return "Controller?type=course&listSelect="+listSelect;
	}
	
}
