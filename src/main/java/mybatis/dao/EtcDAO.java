package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.StaffVO;

public class EtcDAO {
	
	public static StaffVO[] getList() {
		StaffVO[] ar = null;
		// SQL문장을 실행하기 위해 sqlsession을 만든다
		SqlSession ss = FactoryService.getFactory().openSession();
		// 구해진 session을 통해 SQL문을 실행한다.
		List<StaffVO> list = ss.selectList("staff.all");
		if (list.size() > 0) {
			ar = new StaffVO[list.size()];
			list.toArray(ar);
		}
		
		return ar;
	}
	
}
