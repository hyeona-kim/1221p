package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.RoomVO;

public class RoomDAO {
	public static RoomVO[] getList() {
		RoomVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<RoomVO> list = ss.selectList("room.all");
		ss.close();
		
		if(list != null && !list.isEmpty()) {
			ar = new RoomVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
	
	public static RoomVO searchList(String r_idx) {
		RoomVO ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		ar = ss.selectOne("room.search",r_idx);
		ss.close();
		
		return ar;
	}
}
