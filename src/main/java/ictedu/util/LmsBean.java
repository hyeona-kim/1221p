package ictedu.util;

import mybatis.dao.CourseTypeDAO;
import mybatis.dao.EtcDAO;
import mybatis.dao.RoomDAO;
import mybatis.dao.TimeDAO;
import mybatis.vo.CourseTypeVO;
import mybatis.vo.RoomVO;
import mybatis.vo.StaffVO;
import mybatis.vo.TimeVO;

public class LmsBean {
	//������ ���� �ð�ǥ ti_idx���� �޾Ƽ� �װͿ� ���� TimeVO�� ��ȯ���ִ� ��ü �����
	
	public TimeVO searchTime(String ti_idx) {
		TimeVO tvo = null;
		TimeVO[] ar = TimeDAO.getList();
		for(TimeVO vo : ar) {
			if(vo.getTi_idx().equalsIgnoreCase(ti_idx)) {
				tvo = vo;
				break;
			}
		}
		return tvo;
	}
	
	public StaffVO searchStaff(String t_idx) {
		StaffVO tvo = null;
		//��� �������� �������� sql���� ��������
		StaffVO[] ar = EtcDAO.getList();
		for(StaffVO vo : ar) {
			if(vo.getSf_idx().equals(t_idx)) {
				tvo= vo;
				break;
			}
		}
		return tvo;
	}
	
	public CourseTypeVO searchCourseType(String ct_idx) {
		CourseTypeVO cvo= null;
		CourseTypeVO[] ar = CourseTypeDAO.getList();
		for(CourseTypeVO vo : ar) {
			if(vo.getCt_idx().equals(ct_idx)) {
				cvo = vo;
				break;
			}
		}
		return cvo;
	}
	
	public RoomVO searchRoom(String r_idx) {
		RoomVO rvo  = null;
		RoomVO[] ar = RoomDAO.getList();
		for(RoomVO vo : ar) {
			if(vo.getR_idx().equals(r_idx)) {
				rvo = vo;
				break;
			}
		}
		return rvo;
	}
	
}
