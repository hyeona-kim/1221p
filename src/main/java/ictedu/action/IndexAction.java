package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class IndexAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse respone) {
		// TODO Auto-generated method stub
		
		return "index.jsp";
	}

}
