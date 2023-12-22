package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.StaffVO;

public class EtcDAO {
	
	public static StaffVO[] getList() {
		StaffVO[] ar = null;
		// SQL臾몄옣�쓣 �떎�뻾�븯湲� �쐞�빐 sqlsession�쓣 留뚮뱺�떎
		SqlSession ss = FactoryService.getFactory().openSession();
		// 援ы빐吏� session�쓣 �넻�빐 SQL臾몄쓣 �떎�뻾�븳�떎.
		List<StaffVO> list = ss.selectList("staff.all");
		if (list!= null && !list.isEmpty()) {
			ar = new StaffVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
}
