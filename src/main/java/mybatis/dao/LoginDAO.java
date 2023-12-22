package mybatis.dao;

import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.StaffVO;

public class LoginDAO {
	//로그인에 필요한 dao를 만든다
	
	public static StaffVO login_admin(HashMap<String, String> map) {
		// rt_idx =9인 사람만 로그인해서 접근 할 수 있다
		StaffVO svo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		svo = ss.selectOne("staff.login_admin",map);
		ss.close();
		return svo;
	}
	
	public static StaffVO login_teacher(HashMap<String, String> map) {
		// rt_idx 가 0~8 인 사람만 로그인해서 접근 할 수 있다
		StaffVO svo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		svo = ss.selectOne("staff.login_teacher",map);
		ss.close();
		return svo;
	}
	
	public static void login_train(HashMap<String, String> map) {
		// traineeVO생성후 그 객체를 반환 하도록 
	}
}
