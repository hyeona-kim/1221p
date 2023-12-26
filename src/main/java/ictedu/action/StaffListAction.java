package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.EtcDAO;
import mybatis.vo.StaffVO;

public class StaffListAction implements Action{

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// [湲고�愿�由� -> 援먯쭅�썝�쁽�솴] �쓣 �겢由� �뻽�쓣�븣 �닔�뻾�븯�뒗 怨�
		// EtcDAO�쓽 getList�븿�닔瑜� �씠�슜�빐�꽌 DB�뿉�꽌 媛믪쓣 媛��졇�삩�떎
		
		StaffVO[] ar = EtcDAO.getList();
		
		request.setAttribute("ar",ar);
		
		return "/jsp/admin/etcList/staffList.jsp";
	}

}
