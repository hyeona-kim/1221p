package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StaffEditFormAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {

		return "/jsp/admin/etcList/edit_ajax.jsp";
	}

}
