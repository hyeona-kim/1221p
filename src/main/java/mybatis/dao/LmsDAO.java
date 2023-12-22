package mybatis.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;


public class LmsDAO {
	
	public static int getCount(String bname) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("bbs.count",bname);
		ss.close();
		
		return cnt;
		
		
	}
	
	
	
	
	// ������ �����ϴ� ���
	public static int add(String subject, String writer, String content,String fname, String oname, String ip, String bname) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("subject",subject);
		map.put("writer",writer);
		map.put("content",content);
		map.put("fname",fname);
		map.put("oname",oname);
		map.put("ip",ip);
		map.put("bname",bname);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("bbs.add",map);
		
		if(cnt > 0)
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
		return cnt;
		
	}
	// ���� ���
	

	
	// ������ �����ϴ� ���
		public static int edit(String b_idx, String subject, String content,String fname, String oname, String ip) {
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("b_idx",b_idx);
			map.put("subject",subject);
			map.put("content",content);
			if(fname !=null) {
			map.put("fname",fname);
			map.put("oname",oname);
			}
			map.put("ip",ip);
			
			SqlSession ss = FactoryService.getFactory().openSession();
			int cnt = ss.insert("bbs.update",map);
			
			if(cnt > 0)
				ss.commit();
			else
				ss.rollback();
			
			ss.close();
			return cnt;
			
		}
		// �����ϱ� 
	public static int del(String b_idx) {
		// bbs.xml�� �ִ� del�̶�� ���̵� ���� sql�� ȣ��
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("bbs.del",b_idx);
		
		if(cnt >0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
		
		return cnt;
		
	}
	// ��ȸ�� ���� 
	public static int hit(String b_idx) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.update("bbs.hit",b_idx);
		
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	
		return cnt;
	}

}
