package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.StaffVO;
import mybatis.vo.SuggestionVO;
import mybatis.vo.TraineeVO;

public class SchoolDAO {
	
	public static int reGetTotalRecord(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("suggestion.reCount", map);
		ss.close();
		return cnt;
	}
	
	public static int getTotalRecord() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("suggestion.count");
		ss.close();
		return cnt;
	}
	
	public static TraineeVO[] getList() {
		TraineeVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<TraineeVO> list = ss.selectList("trainee.all");
		
		if (list!= null && !list.isEmpty()) {
			ar = new TraineeVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}
	
	public static void addSuggestion(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("suggestion.add", map);
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
	
	public static SuggestionVO[] getSuggList(int begin, int end) {
		SuggestionVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		List<SuggestionVO> list = ss.selectList("suggestion.all", map);
		
		if (list != null && !list.isEmpty()) {
			ar = new SuggestionVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		
		return ar;
	}
	
	public static void addReply(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("suggestion.addReply", map);
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
	
	public static SuggestionVO[] searchSugg(HashMap<String, String> map) {
		SuggestionVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<SuggestionVO> list = ss.selectList("suggestion.search", map);
		if (list != null && !list.isEmpty()) {
			ar = new SuggestionVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		
		return ar;
	}
}
