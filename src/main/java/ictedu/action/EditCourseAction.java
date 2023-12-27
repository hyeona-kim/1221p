package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseDAO;
import mybatis.vo.CourseVO;

public class EditCourseAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		  String viewPath = null;
		  
		  	System.out.println("editAction들어옴"); 
		      // c_idx 파라미터 받아오기
 
            String c_idx = request.getParameter("c_idx");
            System.out.println(c_idx); 

            // c_idx瑜� 湲곕컲�쑝濡� CourseVO 媛앹껜 媛��졇�삤湲�
            CourseVO vo = CourseDAO.getCourse(c_idx);

            request.setAttribute("vo", vo);

            // 수정된 게시물을 보여주기 위한 경로 설정
            viewPath = "Controller?type=course&listSelect=1";

     
        return viewPath;
	}

}
