package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.TrainuploadDAO;
import mybatis.vo.TrainuploadVO;

public class TrainuploadviewAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		String tn_idx = request.getParameter("tn_idx");
		
		TrainuploadVO vo = TrainuploadDAO.view(tn_idx);
		String viewPath = null;
		if(vo !=null) {
			request.setAttribute("vo6", vo);
			viewPath = "jsp/admin/schoolRecord/trainuploadview.jsp";
		}
		
		return viewPath;
		
	}		

}
