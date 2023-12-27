package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.TrainuploadVO;

public class TrainuploadDAO {
	
	public static int getCount() {
	SqlSession ss = FactoryService.getFactory().openSession();
	int cnt = ss.selectOne("upload.count");
	ss.close();
	
	return cnt;
	}
	
	public static TrainuploadVO[] getlist(int begin, int end) {
		TrainuploadVO[] ar =null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, String> map = new HashMap<String, String>();
		
		List<TrainuploadVO> list = ss.selectList("upload.list",map);
		
		if(list !=null && !list.isEmpty()) {
			ar = new TrainuploadVO[list.size()];
			
			list.toArray(ar);
			
		}
		
		ss.close();
		
		return ar;
	}
	
	public static int add(String subject, String content, String fname, String oname, String tn_name ) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("subject", subject);
		map.put("content", content);
		map.put("fname", fname);
		map.put("oname", oname);
		map.put("tn_name", tn_name);
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("upload.add",map);
		
		if(cnt>0)
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
		
		
		
		return cnt;
		
	}
	
	public static TrainuploadVO getUpload(String tn_idx) {
		
		SqlSession ss = FactoryService.getFactory().openSession();
		TrainuploadVO vo = ss.selectOne("upload.getUpload",tn_idx);
		ss.close();
		
		return vo;
		
	}
	
	public static int edit(String tn_idx,String subject, String content, String fname, String oname) {
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("tn_idx", tn_idx);
		map.put("subject", subject);
		map.put("content", content);
		if(fname !=null) {
			map.put("fname", fname);
			map.put("oname", oname);
		}
		
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("upload.update",map);
		
		if(cnt >0)
			ss.commit();
		else
			ss.rollback();
		ss.close();
		
		
		return cnt;
	}
	
	public static int del(String tn_idx) {
		
		SqlSession ss= FactoryService.getFactory().openSession();
		int cnt = ss.update("upload.del",tn_idx);
		
		if(cnt>0) 
			ss.commit();
		else
			ss.rollback();
		
		ss.close();
		
		return cnt;
			
		
		
		
	}
	
	
	
}
