package ictedu.action;

import java.io.File;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import mybatis.dao.TrainuploadDAO;
import mybatis.vo.TrainuploadVO;

public class TrainuploadEditAction implements Action {

	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
	
		String enc_type = request.getContentType();
		
		String viewPath = null;
		
		if(enc_type !=null && enc_type.startsWith("application")) {
			
			String tn_idx = request.getParameter("select");
			
		
			TrainuploadVO vo = TrainuploadDAO.getUpload(tn_idx);
			if(vo !=null)
				request.setAttribute("vo3", vo);
			viewPath = "jsp/admin/schoolRecord/TrainuploadEdit.jsp";
		}else if(enc_type !=null && enc_type.startsWith("multipart")){
			
			
			ServletContext application = request.getServletContext();
			String realPath = application.getRealPath("/ictedu_upload");
			
			try {
			
				MultipartRequest mr = new MultipartRequest(request, realPath, 1024*1024*100, "utf-8",new DefaultFileRenamePolicy());
				
			
				
				String tn_idx = mr.getParameter("tn_idx");
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				
				
				
				File f = mr.getFile("file");
				
				String fname = null;
				String oname = null;
				if(f !=null) {
					fname = f.getName();
					oname = mr.getOriginalFileName("file");
				}
				
				int cnt = TrainuploadDAO.edit(tn_idx, title, content, fname, oname);
				
				viewPath ="Controller?type=trainupload&tn_idx="+tn_idx;
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return viewPath;
		
		
	}

}
