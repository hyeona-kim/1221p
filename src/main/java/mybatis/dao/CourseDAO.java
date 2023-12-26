package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.CourseVO;

public class CourseDAO {
	
	public static CourseVO[] getCourseList(int begin, int end) {
		CourseVO[] ar = null;
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("begin",String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("course.list",map);
		if (list!= null && !list.isEmpty()) {
			ar = new CourseVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		return ar;
	}


	public static void addCourse(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("course.add", map);
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
	
	public static CourseVO[] SearchCourse(HashMap<String, String> map) {
		CourseVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("course.search",map);
		if (list!= null && !list.isEmpty()) {
			ar = new CourseVO[list.size()];
			list.toArray(ar);
		}
		
		ss.close();
		return ar;
	}
	
	public static int getCount() {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("course.count");
		
		ss.close();
		
		return cnt;
	}
	
}