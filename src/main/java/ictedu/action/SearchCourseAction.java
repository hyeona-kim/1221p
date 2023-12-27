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
		// �˻��� �ؼ� �����ͼ� page��, ar �� �����;� �Ѵ�.
		//���࿡ �˻�â�� ������ �Էµ��������� ar�� null�� �����ϰ� ���� �����Ѵ�. �׷� courseAction���� ar�� ���Ӱ� �޾Ƽ� ��ü�� �������� ar�� �����ؼ� �ޱ� �����̴�.
		// page�� page select�� �Է��Ǵ� value���� �������� 
		// selectYear������ ������ �������� ������ ���Ѵ� .
	
		String numPerPage = request.getParameter("num");
		String year = request.getParameter("year");
		String select = request.getParameter("select");
		String value = request.getParameter("value");
		Paging page = null;
		System.out.println(numPerPage);
		if(numPerPage != null)
			page = new Paging(Integer.parseInt(numPerPage),5);
		else 
			page = new Paging(); 
		request.setAttribute("page", page);
		
		System.out.println(select);
		//System.out.println(value);
		System.out.println(year);
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
		
		System.out.println(value);
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("select", select);
		map.put("value", value);
		map.put("begin", String.valueOf(page.getBegin()));
		map.put("end", String.valueOf(page.getEnd()));
		
		CourseVO[] ar = CourseDAO.SearchCourse(map);
	
		request.setAttribute("ar", ar);
		
		return "Controller?type=course";
	}
	
}
