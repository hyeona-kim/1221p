package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.LmsBean;
import ictedu.util.Paging;
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
		// selectYear에서의 연도는 개강일의 연도를 뜻한다 .
		String numPerPage = request.getParameter("page");
		String year = request.getParameter("year");
		String select = request.getParameter("select");
		String value = request.getParameter("value");
		Paging page ;
		if(numPerPage!= null)
			page = new Paging(Integer.parseInt(numPerPage),5);
		else 
			page = new Paging(); 
		request.setAttribute("page", page);
		
		
		LmsBean bean = new LmsBean();
		if(select.equals("1")) {
			StaffVO vo = bean.searchStaff2(value);
			value = vo.getSf_idx();
		}else if(select.equals("2")) {
			CourseTypeVO vo = bean.searchCourseType2(value);
			value = vo.getCt_idx();
		}else if(select.equals("3")) {
			RoomVO vo = bean.searchRoom2(value);
			value = vo.getR_idx();
		}
			
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("select", select);
		map.put("value", value);
		map.put("begin", String.valueOf(page.getBegin()));
		map.put("end", String.valueOf(page.getEnd()));
		
		CourseVO[] ar = null;
	
		request.setAttribute("ar", ar);
		
		return "Controller?type=course";
	}
	
}
