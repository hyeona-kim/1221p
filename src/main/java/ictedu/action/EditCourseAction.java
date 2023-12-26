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
		
		String enc_type = request.getContentType();
		String viewPath = null;
	
		if(enc_type != null && enc_type.startsWith("application")) {
			
			String c_idx = request.getParameter("c_idx");
			
	//		CourseVO vo = BbsDAO.getBbs(b_idx);
			
			// 위의 BbsVO를 edit.jsp에서 표현하기 위해 request에 저장
		//	request.setAttribute("vo", vo);
			viewPath = "edit.jsp";
			
		}else if(enc_type != null && enc_type.startsWith("multipart")) {
			// DB에서 Update하기!
			ServletContext application = request.getServletContext();
			String realPath = application.getRealPath("/bbs_upload");
			
			try {
				//첨부파일 처리
				MultipartRequest mr =new MultipartRequest(request, realPath, 1024*1024*5, "utf-8",
																					new DefaultFileRenamePolicy());
				// 첨부파일이 있었다면  이때 이미 저장된 상태다.
				
				// 나머지 제목, 내용, 글쓴이 등 파라미터 받기
				String b_idx = mr.getParameter("b_idx");
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				
				//첨부파일이 있었다면 DB에서 기존 파일명을 지우고
				// 새로업로드된 파일명으로 수정해야 한다.
				// 그러므로 파일명을 알아내야한다.
				File f = mr.getFile("file");
				
				String fname = null;
				String oname = null;
				if( f !=null) {
					fname = f.getName(); // 저장된 파일명
					oname = mr.getOriginalFileName("file");
				}
				String ip = request.getRemoteAddr();
				
			//	CourseDAO.edit(b_idx, title, content, fname, oname, ip);
				
				viewPath = "Controller?type=view&b_idx="+b_idx;
			} catch (Exception e) {
					e.printStackTrace();
			}
			
		}
			
		return viewPath;
	}

}
