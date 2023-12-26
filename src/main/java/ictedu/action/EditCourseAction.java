package ictedu.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.CourseDAO;
import mybatis.vo.CourseVO;


public class EditCourseAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String viewPath = null;

        try {
            // c_idx 파라미터 받아오기
            String c_idx = request.getParameter("c_idx");

            // c_idx를 기반으로 CourseVO 객체 가져오기
            CourseVO vo = CourseDAO.getCourse(c_idx);

            // 폼으로부터 다른 파라미터들 가져오기
            String c_name = request.getParameter("c_name");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String course_fee = request.getParameter("course_fee");
            String c_peo_num = request.getParameter("c_peo_num");
            String c_round_num = request.getParameter("c_round_num");
            

            // CourseDAO의 edit 메소드 호출
            CourseDAO.edit(c_name, start_date, end_date, course_fee, c_peo_num, c_round_num);

            // 수정된 게시물을 보여주기 위한 경로 설정
            viewPath = "Controller?type=view&c_idx=" + c_idx;
        } catch (Exception e) {
            // 예외 처리
            e.printStackTrace();
        }

        return viewPath;
		}
	}

