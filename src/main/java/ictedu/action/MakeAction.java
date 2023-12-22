package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.vo.TimeVO;

public class MakeAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// TimeVO객체를 받아서 이를 저장한다 .
		// 과정명, 담당교수, 개강일,종료일,요일,회차, 주차, 모집인원, 관리
		TimeVO[] ar = null;
		
		request.setAttribute("ar", ar);
		
		return "/jsp/admin/courseReg/maketime.jsp";
	}

}
