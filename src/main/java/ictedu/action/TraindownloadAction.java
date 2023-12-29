package ictedu.action;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;

import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class TraindownloadAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		String fname = request.getParameter("fname");
		
		ServletContext application = request.getServletContext();
		String realPath = application.getRealPath("/ictedu_upload/"+fname);
		
		File f = new File(realPath);
		
		if(f.exists()) {
			byte[] buf = new byte[4096];
			int size = -1;
			
			
			BufferedInputStream bis = null;
			FileInputStream fis = null;
			
			BufferedOutputStream bos = null;
			
			ServletOutputStream sos = null;
			
			try {
				
				response.setContentType("application/x-msdownload");
				response.setHeader("Content-Disposition", "attachment;filename="+new String(fname.getBytes(),"8859_1"));
				
				sos = response.getOutputStream();
				bos = new BufferedOutputStream(sos);
				
				while((size =bis.read(buf)) != -1) {
					bos.write(buf,0,size);
					bos.flush();
				}
				
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(fis !=null)
						fis.close();
					if(bis !=null)
						bis.close();
					if(sos !=null)
						sos.close();
					if(bos !=null)
						bos.close();
				} catch (Exception e2) {
					e2.printStackTrace();
				}
			}
			
		}
		
		
		
		
		return null;
	}

}
