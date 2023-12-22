package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.CourseVO;

public class ServeDAO {
	public static int getCount() {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("serve.count");
		
		ss.close();
		
		return cnt;
	}
	

	public static CourseVO[] getlist(int begin, int end) {
		CourseVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("begin",String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		List<CourseVO> list = ss.selectList("serve.list",map);
		if(list !=null && !list.isEmpty()) {
			ar = new CourseVO[list.size()];
			list.toArray(ar);
			
		}
		ss.close();
		
		return ar;
	}
}
