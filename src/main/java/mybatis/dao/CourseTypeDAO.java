package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.CourseTypeVO;

public class CourseTypeDAO {
	public static CourseTypeVO[] getList() {
		CourseTypeVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CourseTypeVO> list = ss.selectList("courseType.all");
		ss.close();
		
		if(list != null && !list.isEmpty()) {
			ar = new CourseTypeVO[list.size()];
			list.toArray(ar);
		}
		return ar;
	}
}
