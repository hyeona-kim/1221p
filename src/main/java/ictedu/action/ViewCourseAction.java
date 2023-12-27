package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseDAO;
import mybatis.vo.CourseVO;

public class ViewCourseAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String viewPath = null;

        // c_idx 파라미터 받아오기
        String c_idx = request.getParameter("c_idx");

        // c_idx를 기반으로 CourseVO 객체 가져오기
        CourseVO vo = CourseDAO.getCourse(c_idx);

        // 가져온 CourseVO를 request에 저장
        request.setAttribute("ecvo", vo);

        // 수정 폼을 표시하는 JSP 페이지 경로 설정
        viewPath = "/table/Editbasics.jsp";

        return viewPath;
    }

}
