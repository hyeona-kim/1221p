package mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import mybatis.service.FactoryService;
import mybatis.vo.TrainuploadVO;

public class ConfirmDAO {
	public static TrainuploadVO[] searchconfirm() {
		TrainuploadVO[] ar = null;
		SqlSession ss = FactoryService.getFactory().openSession();
		List<TrainuploadVO> list = ss.selectList("confirm.search");
		
		if(list !=null && !list.isEmpty()) {
			ar = new TrainuploadVO[list.size()];
			list.toArray(ar);
		}
		ss.close();
	
		return ar;
	}

}
