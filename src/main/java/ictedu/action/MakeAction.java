package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.vo.TimeVO;

public class MakeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TimeVO��ü�� �޾Ƽ� �̸� �����Ѵ� .
		// ������, ��米��, ������,������,����,ȸ��, ����, �����ο�, ����
		TimeVO[] ar = null;
		
		request.setAttribute("ar", ar);
		
		return "/jsp/admin/courseReg/maketime.jsp";
	}

}
