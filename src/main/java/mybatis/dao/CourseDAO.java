package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.CourseVO;
import mybatis.vo.StaffVO;

public class CourseDAO {
	
	public static CourseVO[] getCourseList() {
		CourseVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("course.list");
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
	
	public static int del(String c_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("course.del", c_idx);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		return cnt;
	}
	
		public static CourseVO getBbs(String c_idx) {
			SqlSession ss = FactoryService.getFactory().openSession();
			CourseVO courseVO = ss.selectOne("course.getCourse",c_idx);
			ss.close();
			
			return courseVO;
		}
}