package ictedu.util;

import mybatis.vo.TimeVO;

public class LmsBean {
	//������ ���� �ð�ǥ ti_idx���� �޾Ƽ� �װͿ� ���� TimeVO�� ��ȯ���ִ� ��ü �����
	
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
