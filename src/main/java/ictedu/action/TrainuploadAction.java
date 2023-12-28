package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.TraineecurrentDAO;
import mybatis.dao.TrainuploadDAO;
import mybatis.vo.TrainuploadVO;

public class TrainuploadAction implements Action{
	public String execute(HttpServletRequest request, HttpServletResponse response) {
	
		Paging page = new Paging();
		
		page.setTotalRecord(TraineecurrentDAO.getCount());
		
		String cPage = request.getParameter("cPage");
		
		if(cPage == null || cPage.length()==0 )
			page.setNowPage(1);
		else {
			int nowPage = Integer.parseInt(cPage);
			page.setNowPage(nowPage);
			
		}
		
	
		
		TrainuploadVO[] ar = TrainuploadDAO.getlist(page.getBegin(), page.getEnd());
		
		
		request.setAttribute("page", page);
		request.setAttribute("ar", ar);
		
		return "jsp/admin/schoolRecord/trainupload.jsp";
		
		
	
		
		
		
	}
	
	
	
	

}
