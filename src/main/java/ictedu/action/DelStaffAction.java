package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EtcDAO;

public class DelStaffAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// Action을 수행할때 전달받는 sf_idx를 저장한다
		String idx = request.getParameter("sf_idx");
		
		EtcDAO.delStaff(idx);
		
		return "Controller?type=staffList";
	}

}
