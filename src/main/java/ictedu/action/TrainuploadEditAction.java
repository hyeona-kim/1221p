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
			// �����Ҷ��� ����
			
			// �Խù��� �⺻Ű tn_idx �Ķ���� �޾ƾ� ��������
			String tn_idx = request.getParameter("tn_idx");
			
			// �ش� �Խù��� ��ü(TrainuploadVO)������
			
			TrainuploadVO vo = TrainuploadDAO.getUpload(tn_idx);
			
			request.setAttribute("vo3", vo);
			viewPath = "jsp/admin/schoolRecord/TrainuploadEdit.jsp";
		}else if(enc_type !=null && enc_type.startsWith("multipart")){
			//db�� ������Ʈ �ϰ� ��û����� post��� �۵���Ҷ� ������ ������ �����ϰ� ���±� ������
			// multipart���� ����
			
			ServletContext application = request.getServletContext();
			String realPath = application.getRealPath("/ictedu_upload");
			
			try {
				//÷������ ó��
				MultipartRequest mr = new MultipartRequest(request, realPath, 1024*1024*100, "utf-8",new DefaultFileRenamePolicy());
				
				// ÷�������� �־��ٸ� �̹� ����� ����
				
				String tn_idx = mr.getParameter("tn_idx");
				String title = mr.getParameter("title");
				String content = mr.getParameter("content");
				
				// ÷�������� �־��ٸ� db���� ���� ���̸��� ����� ���� ���ε�� ���ϸ����� ����
				// �׷��� ������ ���ϸ��� �˾Ƴ��� �Ѵ�
				
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
