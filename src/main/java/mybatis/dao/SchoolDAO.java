package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.SuggestionVO;
import mybatis.vo.TraineeVO;

public class SchoolDAO {
	
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
	
	public static SuggestionVO[] getSuggList() {
		SuggestionVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		List<SuggestionVO> list = ss.selectList("suggestion.all");
		
		if (list != null && !list.isEmpty()) {
			ar = new SuggestionVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		
		return ar;
	}

}
