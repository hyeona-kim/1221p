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


public static int add(String c_name, String start_date, 
		String end_date, String course_fee, String c_peo_num, 
		String c_round_num) {
	HashMap<String, String> map = new HashMap<String, String>();
	map.put("c_name", c_name);
	map.put("start_date", start_date);
	map.put("end_date", end_date);
	map.put("course_fee", course_fee);
	map.put("c_peo_num", c_peo_num);
	map.put("c_round_num", c_round_num);
	
	SqlSession ss = FactoryService.getFactory().openSession();
	int cnt = ss.insert("course.add", map);
	if(cnt > 0)
		ss.commit();
	else
		ss.rollback();
	
	ss.close();
	return cnt;
	}
}