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
            // c_idx �뙆�씪誘명꽣 諛쏆븘�삤湲�
            String c_idx = request.getParameter("c_idx");

            // c_idx瑜� 湲곕컲�쑝濡� CourseVO 媛앹껜 媛��졇�삤湲�
            CourseVO vo = CourseDAO.getCourse(c_idx);

            // �뤌�쑝濡쒕��꽣 �떎瑜� �뙆�씪誘명꽣�뱾 媛��졇�삤湲�
            String c_name = request.getParameter("c_name");
            String start_date = request.getParameter("start_date");
            String end_date = request.getParameter("end_date");
            String course_fee = request.getParameter("course_fee");
            String c_peo_num = request.getParameter("c_peo_num");
            String c_round_num = request.getParameter("c_round_num");
            

            CourseDAO.edit(c_name, start_date, end_date, course_fee, c_peo_num, c_round_num);

      
            viewPath = "Controller?type=view&c_idx=" + c_idx;
        } catch (Exception e) {
            // �삁�쇅 泥섎━
            e.printStackTrace();
        }

        return viewPath;
		}
	}

