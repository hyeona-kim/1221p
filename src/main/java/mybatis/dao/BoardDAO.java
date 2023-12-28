package mybatis.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.BoardVO;
import mybatis.vo.SuggestionVO;
import mybatis.vo.TraineeVO;

public class BoardDAO {
	
	public static int reGetTotalRecord(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("board.reCount", map);
		ss.close();
		return cnt;
	}
	
	public static int getTotalRecord() {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.selectOne("board.count");
		ss.close();
		return cnt;
	}
	
	
	public static void addBoard(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("board.add", map);
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
	
	public static BoardVO[] getBoardList(int begin, int end) {
		BoardVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("begin", String.valueOf(begin));
		map.put("end", String.valueOf(end));
		
		List<BoardVO> list = ss.selectList("board.all", map);
		
		if (list != null && !list.isEmpty()) {
			ar = new BoardVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		
		return ar;
	}
	
	public static void addReply(HashMap<String, String> map) {
		SqlSession ss = FactoryService.getFactory().openSession();
		int cnt = ss.insert("board.addReply", map);
		if(cnt > 0) {
			ss.commit();
		}else {
			ss.rollback();
		}
		ss.close();
	}
	
	public static BoardVO[] searchBoard(HashMap<String, String> map) {
		BoardVO[] ar = null;
		
		SqlSession ss = FactoryService.getFactory().openSession();
		List<BoardVO> list = ss.selectList("board.search", map);
		if (list != null && !list.isEmpty()) {
			ar = new BoardVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
		
		return ar;
	}
	
}
