package ictedu.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mybatis.dao.CourseTypeDAO;
import mybatis.vo.CourseTypeVO;

public class CourseTypeAddAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		String[] ct_name = request.getParameterValues("name");
		String[] ct_color = request.getParameterValues("text");
		String listSelect = request.getParameter("listSelect");
		CourseTypeVO vo = new CourseTypeVO();
		if(ct_name != null && !ct_name.equals("")) {
			for(int i = 0; i < ct_name.length;i++) {
				if(ct_name[i] != null && !ct_name[i].equals("")) {
					vo.setCt_name(ct_name[i]);
					vo.setCt_color(ct_color[i]);
					vo.setCt_idx(Integer.toString(i+1));
					CourseTypeDAO.addType(vo);
				}
				
			}
		}
		return "Controller?type=course&listSelect="+listSelect;
	}

}
