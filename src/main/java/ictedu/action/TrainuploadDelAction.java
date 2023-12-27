package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.TrainuploadDAO;

public class TrainuploadDelAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		

		String tn_idx = request.getParameter("tn_idx");
		
		int cnt = TrainuploadDAO.del(tn_idx);
		
		return "Controller?type=trainupload";
		
	}

}
