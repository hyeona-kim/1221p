package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.RoomDAO;
import mybatis.vo.RoomVO;


public class RoomAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String[] r_name = request.getParameterValues("className");
		String[] r_sep = request.getParameterValues("roomSep");
		String[] r_status = request.getParameterValues("use");
		String listSelect = request.getParameter("listSelect");
		RoomVO vo = new RoomVO();
		
		if(r_name != null && !r_name.equals("")) {
			for(int i = 0; i < r_name.length;i++) {
				if(r_name[i] != null && !r_name[i].isEmpty()) {
					vo.setR_name(r_name[i]);
					vo.setR_sep(r_sep[i]);
					vo.setR_status(r_status[i]);
					vo.setR_idx(Integer.toString(i+1));
					RoomDAO.addRoom(vo);
				}
				
			}
		}
		return "Controller?type=course&listSelect="+listSelect;
	}

}
