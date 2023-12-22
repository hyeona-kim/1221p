package mybatis.dao;

import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.StaffVO;

public class LoginDAO {
	//�α��ο� �ʿ��� dao�� �����
	
	public static StaffVO login_admin(HashMap<String, String> map) {
		// rt_idx =9�� ����� �α����ؼ� ���� �� �� �ִ�
		StaffVO svo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		svo = ss.selectOne("staff.login_admin",map);
		ss.close();
		return svo;
	}
	
	public static StaffVO login_teacher(HashMap<String, String> map) {
		// rt_idx �� 0~8 �� ����� �α����ؼ� ���� �� �� �ִ�
		StaffVO svo = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		svo = ss.selectOne("staff.login_teacher",map);
		ss.close();
		return svo;
	}
	
	public static void login_train(HashMap<String, String> map) {
		// traineeVO������ �� ��ü�� ��ȯ �ϵ��� 
	}
}
