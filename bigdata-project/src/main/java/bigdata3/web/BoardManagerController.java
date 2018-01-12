package bigdata3.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bigdata3.domain.BoardManager;
import bigdata3.service.BoardManagerService;

@Controller
@RequestMapping("/board")
//@SessionAttributes("loginInfo")
public class BoardManagerController {
  
  @Autowired BoardManagerService boardManagerService;
  
  @RequestMapping("infopage")
  public String info(@RequestParam(defaultValue="1") int startIndex, 
      @RequestParam(defaultValue="5") int pageSize,
      Model model) {
    
    List<BoardManager> board = boardManagerService.list(startIndex, pageSize);
    
    model.addAttribute("board", board);
    
    return "";
  }
  
  @RequestMapping("add")
  public String createform() {
    return "";
  }
  
  @RequestMapping("insert")
  public String insert(BoardManager boardManager) {
    
//    String manager = member.getMemberName();
//    boardManager.setBoardManager(manager);
    
    boardManagerService.insertBoard(boardManager);
    
    return "";
  }
  
  
}
