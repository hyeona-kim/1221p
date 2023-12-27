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
	
	public static void addRoom(RoomVO vo) {
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int key = ss.selectOne("room.key", vo.getR_idx());
		
		if(key == 0)
			key = ss.insert("room.add", vo);
		else
			key = ss.update("room.update", vo);
		if(key > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
}
