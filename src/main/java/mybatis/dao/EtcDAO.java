package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.StaffVO;
import mybatis.vo.SuggestionVO;

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
	
	public static void addStaff(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("staff.add", map);
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
	public static StaffVO searchList(String sf_name) {
		StaffVO ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		ar = ss.selectOne("staff.all",sf_name);
		
		ss.close();
		return ar;
	}
	public static void delStaff(String idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("staff.del", idx);
		if (cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
	
	public static String[] searchSfCode() {
		String[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<String> list = ss.selectList("staff.search_sfCode");
		if(list != null && !list.isEmpty()) {
			ar = new String[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
}
