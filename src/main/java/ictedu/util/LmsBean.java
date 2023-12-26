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
	//과정에 따른 시간표 ti_idx값을 받아서 그것에 따른 TimeVO를 반환해주는 객체 만들기
	
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
		//모든 스테프를 가져오는 sql문장 가져오기
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
