package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.CourseVO;

public class CourseDAO {
	
	public static CourseVO[] getCourseList() {
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("course.list");
		ss.close();

		// List가 null이거나 비어 있을 경우 빈 배열 반환
		if (list == null || list.isEmpty()) {
			return new CourseVO[0];
		}

		// List를 배열로 변환하여 반환
		return list.toArray(new CourseVO[list.size()]);
	}
}
