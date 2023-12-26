package ictedu.util;

import mybatis.vo.TimeVO;

public class LmsBean {
	//과정에 따른 시간표 ti_idx값을 받아서 그것에 따른 TimeVO를 반환해주는 객체 만들기
	
	public TimeVO searchTime(String ti_idx, TimeVO[] t_list) {
		TimeVO tvo = null;
		
		for(TimeVO vo : t_list) {
			if(vo.getTi_idx().equalsIgnoreCase(ti_idx)) {
				tvo = vo;
				break;
			}
		}
		return tvo;
	}
	
	
}
