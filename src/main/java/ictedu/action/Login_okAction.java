package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Login_okAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String viewPath = null;
		String select = request.getParameter("select");
	
		String u_id = request.getParameter("ID");
		String u_pw = request.getParameter("PW");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", u_id);
		map.put("pw", u_pw);
		// select�� ���� �´� dao���� ������ �޾�
		// �´� ������ �ִٸ� ���ǿ� �����Ѵ� 
		
		if(select.equalsIgnoreCase("admin")) {
			viewPath = "/jsp/main/main.jsp";
			// adminVO��ü�� session�� �����Ѵ�
		}else if(select.equalsIgnoreCase("train")) {
			viewPath = "/jsp/train/main.jsp";
			// TrainVO��ü�� session�� �����Ѵ�
		}else if(select.equalsIgnoreCase("teacher")) {
			viewPath = "/jsp/teacher/main.jsp";
			// teacherVO��ü�� session�� �����Ѵ�
		}
		
		return viewPath;
	}

}
