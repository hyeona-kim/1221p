package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.TrainingDAO;
import mybatis.vo.TraineeVO;

public class Traineecurrentbt1Action implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		
		Paging page = new Paging();
		
		page.setTotalRecord(TrainingDAO.getCount());
		String cPage = request.getParameter("cPage");
		
		if(cPage == null || cPage.length()==0) {
			page.setNowPage(1);
		}else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
			
		}
		
		
		
		TraineeVO[] ar = TrainingDAO.getlist(page.getBegin(), page.getEnd());
		
		request.setAttribute("page", page);
		request.setAttribute("ar", ar);
		
		
		
		return "jsp/admin/schoolRecord/traineecurrentbt1.jsp";
	}

}
