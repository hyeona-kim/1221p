package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LoginAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		// ��带 �����ϰ� �� ��忡 ���� ���� �ο����ְ�
		// ������ ������� 0,1,2 �̷� ���·� ������ ���ش� 
		String select = request.getParameter("select");
		String viewPath = null;
		
		String enc_type = request.getContentType();
		//�α��� ��ư�� ������ 
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
