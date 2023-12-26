package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.TrainingDAO;
import mybatis.vo.TraineeVO;

public class TraineeStatusAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		TraineeVO[] ar = TrainingDAO.getTraineeList();
		
		request.setAttribute("ar", ar);
		
		return "/jsp/admin/schoolRecord/TraineeStatus.jsp";
	}

}
