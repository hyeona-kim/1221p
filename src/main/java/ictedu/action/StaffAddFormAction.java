package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StaffAddFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		return "/jsp/admin/etcList/add_ajax.jsp";
	}

}
