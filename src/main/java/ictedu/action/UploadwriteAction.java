package ictedu.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.TrainuploadDAO;

public class UploadwriteAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String viewPath = null;
		// 확인서류등록 이라는 버튼을 눌렀을 때 get 방식으로 현재 객체 수행 
		
		String enc_type = request.getContentType();
		
		if(enc_type == null)
			viewPath = "jsp/admin/schoolRecord/uploadwrite.jsp";
		else if(enc_type.startsWith("multipart")) {
			viewPath = "Controller?type=trainupload";
			try {
				ServletContext application = request.getServletContext();
				
				String realPath = application.getRealPath("/ictedu_upload");
				
				MultipartRequest mr = new MultipartRequest(request, realPath, 1020*1024*100, "utf-8", new DefaultFileRenamePolicy());
				
				
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
			
				String tn_name = mr.getParameter("tn_name");
				
				File f = mr.getFile("file");
				String fname = null;
				String oname = null;
				
				if(f !=null) {
					fname = f.getName();
					oname = mr.getOriginalFileName("file");
					
				}
				
				
				int cnt = TrainuploadDAO.add(title,content,fname,oname,tn_name);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return viewPath;
		
		
		
		
		
		
		
		
	}

}
