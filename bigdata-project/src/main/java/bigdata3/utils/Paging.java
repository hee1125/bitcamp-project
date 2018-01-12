/** 페이징 처리 작업 */
package bigdata3.utils;

public class Paging {
	// 한 페이지당 게시물 수
	public static final int PAGE_SCALE = 10;
	// 한 그룹당 들어갈 페이지 수
	public static final int GROUP_SCALE = 5;
	// 현재 페이지 번호
	private int curPage;
	// 이전
	private int prevPage;
	// 다음
	private int nextPage;
	// 전체 페이지 수
	private int totPage;
	// 전체 그룹 수
	private int totGroup;
	// 현재 위치한 그룹
	private int curGroup;
	// 다음 그룹
	private int nextGroup;
	// 이전 그룹
	private int prevGroup;
	// 한페이지의 시작 게시물
	private int start;
	// 한페이지의 마지막 게시물
	private int end;
	// 그룹 시작 번호
	private int groupStart;
	// 그룹 마지막 번호
	private int groupEnd;
	
	// 생성자
	public Paging(int curPage, int count) {
		super();
		// 현재 해당 그룹 
		this.curGroup = 1;
		this.curPage = curPage;
		this.setTotPage(count);
		this.setPageRange();
		this.setTotGroup();
		this.setGroupRange();
	}

	public void setGroupRange() {
		// 현재 페이지가 몇번째 페이지 블록에 속하는지 계산
		curGroup = (int)Math.ceil((curPage-1) / GROUP_SCALE)+1;
        // 현재 페이지 블록의 시작, 끝 번호 계산
		groupStart = (curGroup-1)*GROUP_SCALE+1;
        // 페이지 그룹의 끝번호
		groupEnd = groupStart+GROUP_SCALE-1;
        // 마지막 블록이 범위를 초과하지 않도록 계산
        if(groupEnd > totPage) groupEnd = totPage;
        // 이전을 누르면 이전 페이지 그룹으로 넘어간다.
        prevPage = (curPage == 1)? 1:(curGroup-1)*GROUP_SCALE;
        // 다음을 누르면 다음 페이지 그룹으로 넘어간다.
        nextPage = curGroup > totGroup ? (curGroup*GROUP_SCALE) : (curGroup*GROUP_SCALE)+1;
        // 마지막 페이지가 범위를 초과하지 않도록 처리
        if(nextPage >= totPage) nextPage = totPage;
	}

	public void setPageRange() {
		// 시작번호 = (현재페이지-1)*페이지당 게시물수 +1
		start = (curPage - 1) * PAGE_SCALE + 1;
		// 끝번호 = 시작번호+페이지당 게시물수 -1
		end = start + PAGE_SCALE - 1;
	}

	// Getter & Setter
	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getTotPage() {
		return totPage;
	}

	public void setTotPage(int count) {
		this.totPage = (int) Math.ceil(count*1.0 / PAGE_SCALE);
	}

	public int getTotGroup() {
		return totGroup;
	}

	public void setTotGroup() {
		this.totGroup = (int)Math.ceil(totPage / GROUP_SCALE);
	}

	public int getCurGroup() {
		return curGroup;
	}

	public void setCurGroup(int curGroup) {
		this.curGroup = curGroup;
	}

	public int getNextGroup() {
		return nextGroup;
	}

	public void setNextGroup(int nextGroup) {
		this.nextGroup = nextGroup;
	}

	public int getPrevGroup() {
		return prevGroup;
	}

	public void setPrevGroup(int prevGroup) {
		this.prevGroup = prevGroup;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	public int getGroupStart() {
		return groupStart;
	}

	public void setGroupStart(int groupStart) {
		this.groupStart = groupStart;
	}

	public int getGroupEnd() {
		return groupEnd;
	}

	public void setGroupEnd(int groupEnd) {
		this.groupEnd = groupEnd;
	}
}
