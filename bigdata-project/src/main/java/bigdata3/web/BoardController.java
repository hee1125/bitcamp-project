package bigdata3.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bigdata3.domain.Board;
import bigdata3.service.BoardService;
import bigdata3.utils.Paging;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	@Autowired BoardService boardService;
	
	@RequestMapping("writeform")
	public String writeform() {
		return "board/writeform";
	}
	
	@RequestMapping("notice")
	public String notice(@RequestParam(defaultValue="1") int curPage, Model model) {
		
		int count = boardService.count();
		
		Paging paging = new Paging(curPage, count);
		
		int start = paging.getStart();
		int end = paging.getEnd();
		
		List<Board> boardList = boardService.list(start, end);
		
		model.addAttribute("boardList", boardList);
		model.addAttribute("count",count);
		model.addAttribute("paging", paging);
		
		return "board/listform";
	}
	
	@RequestMapping("write")
	public String write(Board board) {
		try {
			String boardType = "일반";
			board.setBoardType(boardType);
//			System.out.println(boardWriter);
//			board.setBoardWriter(boardWriter);
			return "redirect:../board/notice";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "board/writeform";
		
	}
	
	@RequestMapping("update")
	public String update(Board board, Model model) {
		boardService.update(board);
		model.addAttribute("board", board);
		return "redirect:../board/detail";
	}
	
	@RequestMapping("detail")
	public String detail(int boardNo, Model model, HttpSession session) {
		boardService.increaseHit(boardNo, session);
		Board board = boardService.detail(boardNo); 
		model.addAttribute("board", board);
		return "board/detailform";
	}
	
	@RequestMapping("delete")
	public String delete(int boardNo) {
		boardService.delete(boardNo);
		return "redirect:../board/notice";
	}
}
