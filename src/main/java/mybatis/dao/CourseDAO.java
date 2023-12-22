package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.CourseVO;

public class CourseDAO {
	public static CourseVO[] getCourseList() {
		CourseVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("course.list");
		if(list != null && !list.isEmpty()) {
			list.toArray(ar);
		}
		return ar;
	}
}
