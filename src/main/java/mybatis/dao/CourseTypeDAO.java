package mybatis.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;

public class CourseTypeDAO {
	public static void addType(HashMap<String, String> map){
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("courseType.add", map);
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
}
