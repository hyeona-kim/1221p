package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.TimeVO;

public class TimeDAO {
	public static TimeVO[] getList() {
		TimeVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<TimeVO> list = ss.selectList("time.all");
		ss.close();
		
		if(list != null && !list.isEmpty()) {
			ar = new TimeVO[list.size()];
			list.toArray(ar);
		}
		return ar;
		
	}
}
