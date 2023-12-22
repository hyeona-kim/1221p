package mybatis.dao;

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
}
