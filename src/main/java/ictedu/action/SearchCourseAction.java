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
		
		String numPerPage = request.getParameter("num"); // 5
		String year = request.getParameter("year"); // 2024
		String select = request.getParameter("select"); // 2
		String value = request.getParameter("value"); // 1
		
		Paging page = null;

		if(numPerPage!=null && numPerPage.length()>0 )
			page = new Paging(Integer.parseInt(numPerPage),5);
		else 
			page = new Paging(); 
		
		page.setNowPage(1);
		System.out.println("begin= "+page.getBegin());
		System.out.println("end= "+page.getEnd());
		System.out.println("startPage= "+page.getStartPage());
		System.out.println("endPage= "+page.getEndPage());
		
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
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("year", year);
		map.put("select", select);
		map.put("value", value);
		map.put("begin", String.valueOf(page.getBegin()));
		map.put("end", String.valueOf(page.getEnd()));
		
		CourseVO[] ar = CourseDAO.searchCourse(map);
	
		//System.out.println(ar.length);
		request.setAttribute("ar", ar);
		request.setAttribute("page", page);
		
		return "Controller?type=course";
	}
	
}
