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
			// 수정할때의 영역
			
			// 게시물의 기본키 tn_idx 파라미터 받아야 수정가능
			String tn_idx = request.getParameter("tn_idx");
			
			// 해당 게시물의 객체(TrainuploadVO)가져옴
			
			TrainuploadVO vo = TrainuploadDAO.getUpload(tn_idx);
			
			request.setAttribute("vo3", vo);
			viewPath = "jsp/admin/schoolRecord/TrainuploadEdit.jsp";
		}else if(enc_type !=null && enc_type.startsWith("multipart")){
			//db에 업데이트 하고 요청방식이 post방식 글등록할때 파일을 무조건 선택하고 보냈기 때문에
			// multipart으로 시작
			
			ServletContext application = request.getServletContext();
			String realPath = application.getRealPath("/ictedu_upload");
			
			try {
				//첨부파일 처리
				MultipartRequest mr = new MultipartRequest(request, realPath, 1024*1024*100, "utf-8",new DefaultFileRenamePolicy());
				
				// 첨부파일이 있었다면 이미 저장된 상태
				
				String tn_idx = mr.getParameter("tn_idx");
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				
				// 첨부파일이 있었다면 db에서 기존 파이멸을 지우고 새로 업로드된 파일명으로 수정
				// 그렇기 때문에 파일명을 알아내야 한다
				
				File f = mr.getFile("file");
				
				String fname = null;
				String oname = null;
				if(f !=null) {
					fname = f.getName();
					oname = mr.getOriginalFileName("file");
				}
				
				TrainuploadDAO.edit(tn_idx, title, content, fname, oname);
				
				viewPath ="Controller?type=trainupload&tn_idx="+tn_idx;
				
				
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
		}
		
		
		return viewPath;
		
		
	}

}
