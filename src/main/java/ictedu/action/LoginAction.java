package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String select = request.getParameter("select");
		String viewPath = null;
		if(select.equalsIgnoreCase("admin")) {
			viewPath = "/jsp/login_admin.jsp";
		}else if(select.equalsIgnoreCase("train")) {
			viewPath = "/jsp/login_train.jsp";
		}else if(select.equalsIgnoreCase("teacher")) {
			viewPath = "/jsp/login_teacher.jsp";
		}
		
		return viewPath;
	}

}
