package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.TraineeVO;

public class TrainingDAO {

	public static TraineeVO[] getTraineeList() {
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
	
	public static int getCount() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("trainee.count");
		ss.close();
		return cnt;
	}
	
	public static TraineeVO[] getlist(int begin, int end) {
		TraineeVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		List<TraineeVO> list = ss.selectList("trainee.list",map);
		
		if (list!= null && !list.isEmpty()) {
			ar = new TraineeVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	
	
}
}
