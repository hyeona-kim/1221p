package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.ConfirmDAO;
import mybatis.vo.TrainuploadVO;

public class ConfirmAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		
		TrainuploadVO[] ar = ConfirmDAO.searchconfirm();
		if(ar !=null)
			request.setAttribute("ar", ar);

		return "/jsp/admin/schoolRecord/confirm_ajax.jsp";
	}

}
