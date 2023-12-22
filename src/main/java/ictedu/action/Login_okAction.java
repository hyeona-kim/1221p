package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mybatis.dao.LoginDAO;
import mybatis.vo.StaffVO;

public class Login_okAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String viewPath = null;
		String select = request.getParameter("select");
	
		String u_id = request.getParameter("ID");
		String u_pw = request.getParameter("PW");
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("u_id", u_id);
		map.put("u_pw", u_pw);
		// select�� ���� �´� dao���� ������ �޾�
		// �´� ������ �ִٸ� ���ǿ� �����Ѵ� 
		HttpSession session = request.getSession();
		if(select.equalsIgnoreCase("admin")) {
			StaffVO vo = LoginDAO.login_admin(map);
			viewPath = "/jsp/admin/counselReceipt/main.jsp";
			session.setAttribute("vo", vo);
			
		}else if(select.equalsIgnoreCase("train")) {
			StaffVO vo = LoginDAO.login_teacher(map);
			viewPath = "/jsp/train/main.jsp";
			session.setAttribute("vo", vo);
			
		}else if(select.equalsIgnoreCase("teacher")) {
			viewPath = "/jsp/teacher/counselReceipt/main.jsp";
			// StaffVO��ü�� session�� �����Ѵ�
		}
		
		
		return viewPath;
	}

}
