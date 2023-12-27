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
	

	public static int del(String c_idx) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("course.del", c_idx);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		return cnt;
	}
	
	public static CourseVO[] searchCourse(HashMap<String, String> map) {
		CourseVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<CourseVO> list = ss.selectList("course.search", map);
		System.out.println(list.size());

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
	
	public static int getSearchCount(HashMap<String, String> map) {	
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("course.search_count",map);
		ss.close();
		
		return cnt;
	}
	
	 public static CourseVO getCourse(String c_idx) {
	        SqlSession ss = FactoryService.getFactory().openSession();
	        CourseVO vo = null;

	        try {
	            vo = ss.selectOne("course.getCourse", c_idx);
	        } catch (Exception e) {
	            e.printStackTrace();
	        } finally {
	            ss.close();
	        }

	        return vo;
	    }
	
	public static int edit(String c_name,String start_date,
			String end_date, String course_fee, 
			String c_peo_num, String c_round_num) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		map.put("c_name", c_name);
		map.put("start_date", start_date);
		map.put("end_date", end_date);
		map.put("course_fee", course_fee);
		map.put("c_peo_num", c_peo_num);
		map.put("c_round_num", c_round_num);
		SqlSession ss = FactoryService.getFactory().openSession();
		
		int cnt = ss.insert("course.edit", map);
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
		return cnt;
	}
	
}