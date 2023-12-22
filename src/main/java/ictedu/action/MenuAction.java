package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MenuAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String select = request.getParameter("select");
		
		
		return "/jsp/admin/"+select+"/main.jsp";
		
		
	}

}
