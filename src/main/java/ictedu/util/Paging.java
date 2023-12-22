package ictedu.util;

public class Paging {
	int nowPage =1; 	// 현재 페이지 값 == cPage
	int numPerPage =10;		// 한 페이지당 보여질 게시물의 수 
	
	int totalRecord; //총게시물의 수 
	int pagePerBlock = 10; // 한 블럭당 표현할 페이지 수 
	
	int totalPage; //전체페이지 수 
	
	int begin; //현재 페이지의 게시물의 행번호
	int end; //현재 페이지의 게시물의 마지막 행번호
	
	int startPage; //한 블럭의 시작 페이지 값
	int endPage; // 한 블럭의 마지막 페이지 값
	
	// 객체를 생성할 때 기본 생성자를 부르면 한 페이지당 10개씩 보여주는 페이징 기법을 지정
	public Paging() {}
	
	public Paging(int numPerPage, int pagePerBlock) {
		this.numPerPage = numPerPage;
		this.pagePerBlock = pagePerBlock;
		
	}

	public int getNowPage() {
		return nowPage;
	}

	public void setNowPage(int nowPage) {
		this.nowPage = nowPage;
		
		// 현재 페이지값이 총 페이지 값을 넘기지못하도록 설정
		if(nowPage > totalPage)
			nowPage = totalPage;
		
		// 시작 행 번호와 마지막 행번호 설정
		begin = (nowPage-1)*numPerPage+1;
		end = nowPage*numPerPage;
		
		// 현재 페이지 값에 따라 블럭의 시작페이지(startPage)구하기
		startPage =(int)((nowPage-1)/pagePerBlock)*pagePerBlock+1;
		
		// 블럭의 마지막 페이지값 구하기
		endPage = startPage + pagePerBlock - 1;
		
		// 마지막 페이지 값이 전체 페이지 수보다 클때를 가정하여
		if(endPage > totalPage)
			endPage = totalPage;
		
		
	}

	public int getNumPerPage() {
		return numPerPage;
	}

	public void setNumPerPage(int numPerPage) {
		this.numPerPage = numPerPage;
	}

	public int getTotalRecord() {
		return totalRecord;
	}

	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
		
		this.totalPage =(int)Math.ceil((double)totalRecord/numPerPage);
		
		
	}

	public int getPagePerBlock() {
		return pagePerBlock;
	}

	public void setPagePerBlock(int pagePerBlock) {
		this.pagePerBlock = pagePerBlock;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getBegin() {
		return begin;
	}

	public void setBegin(int begin) {
		this.begin = begin;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	

}
