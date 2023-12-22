package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// 모드를 설정하고 그 모드에 따른 값을 부여해주고
		// 각각의 멤버들을 0,1,2 이런 상태로 지정을 해준다 
		String select = request.getParameter("select");
		String viewPath = null;
		
		String enc_type = request.getContentType();
		//로그인 버튼을 누르고 
		if(enc_type == null || enc_type.isEmpty()) {	
			if(select.equalsIgnoreCase("admin")) {
				viewPath = "/jsp/login/login_admin.jsp";
			}else if(select.equalsIgnoreCase("train")) {
				viewPath = "/jsp/login/login_train.jsp";
			}else if(select.equalsIgnoreCase("teacher")) {
				viewPath = "/jsp/login/login_teacher.jsp";
			}
		}
		return viewPath;
	}

}
