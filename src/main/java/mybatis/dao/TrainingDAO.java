package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.SuggestionVO;
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
	
}
