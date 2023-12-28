package ictedu.action;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ictedu.util.Paging;
import mybatis.dao.BoardDAO;
import mybatis.dao.SchoolDAO;
import mybatis.vo.BoardVO;
import mybatis.vo.SuggestionVO;

public class SearchBoardAction implements Action {

	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) {
		// [검색]을 눌렀을 때 전달받는 파라미터를 받아서 먼저 저장한다.
				BoardVO[] ar = null;
				Paging page = null;
				boolean bl = true;
				
				String cPage = request.getParameter("cPage");
				String tag = request.getParameter("tag");
				String value = request.getParameter("value");
				
				// 검색을 위한 HashMap을 만든다
				HashMap<String, String> map = new HashMap<String, String>();
				map.put(tag, value);
				
				int cnt = BoardDAO.reGetTotalRecord(map);
				
				if(cnt > 0) {
					page = new Paging();
					page.setTotalRecord(cnt);
					if(cPage.equals("undefined")) {
						page.setNowPage(1);				
					}else {
						page.setNowPage(Integer.parseInt(cPage));								
					}
					map.put("begin", String.valueOf(page.getBegin()));
					map.put("end", String.valueOf(page.getEnd()));
					ar = BoardDAO.searchBoard(map);
				}
				
				request.setAttribute("bl", bl);
				request.setAttribute("ar", ar);
				request.setAttribute("page", page);

				return "Controller?type=boardMain";
			}
	}
