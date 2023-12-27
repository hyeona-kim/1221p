package ictedu.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

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
          
            request.setAttribute("select_vo", vo);

            viewPath ="Controller?type=course&listSelect=1";
    
        return viewPath;
			}
        }
	