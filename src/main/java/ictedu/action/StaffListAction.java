package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EtcDAO;
import mybatis.vo.StaffVO;

public class StaffListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// [기타관리 -> 교직원현황] 을 클릭 했을때 수행하는 곳
		// EtcDAO의 getList함수를 이용해서 DB에서 값을 가져온다
		StaffVO[] ar = EtcDAO.getList();
		request.setAttribute("ar", ar);
		
		return "/jsp/admin/etcList/teacher_list.jsp";
	}

}
