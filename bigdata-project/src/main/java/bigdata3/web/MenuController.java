package bigdata3.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bigdata3.dao.MenuDao;
import bigdata3.domain.Menu;
import bigdata3.service.MenuService;
import bigdata3.utils.Paging;

@Controller
@RequestMapping("/menu")
public class MenuController {
  
  @Autowired MenuService menuService;
  
  @Autowired MenuDao menuDao;
  
  @RequestMapping("regimenu")
  public String regimenu() {
    return "menu/menuregistform";
  }
  
  // 관리자에 등록된 메뉴 정보 출력
  @RequestMapping("manage")
  public String list(@RequestParam(defaultValue="1")int curPage, Model model) {
    
    int count = menuService.count();    
    Paging paging = new Paging(curPage, count);
    
    int start = paging.getStart();
    int end = paging.getEnd();
    
    List<Menu> menuList = menuService.list(start, end);
    
    model.addAttribute("menuList", menuList);
    model.addAttribute("paging", paging);
    model.addAttribute("count", count);
    
    return "menu/manageform";
  }
  
  // 홈페이지에 메뉴 정보 출력
  @RequestMapping("menuInfo")
  public String list(Model model) {
    Menu menu = new Menu();
    List<Menu> menuInfo = menuDao.noPaging(menu);
    
    model.addAttribute("menuInfo", menuInfo);
    
    return "menu/userMenu";
  }
  
  @RequestMapping("regist")
  public String regist(Menu menu) {
    String manager = null; 
//    manager = member.getMemberName();
    menu.setManager(manager);
    menuService.insert(menu);
    return "redirect:../menu/manage";
  }
  
  @RequestMapping("update")
  public String update(Menu menu, Model model) {
    menuService.update(menu);
    model.addAttribute("menu", menu);
    return "redirect:../menu/detail";
  }
  
  @RequestMapping("detail")
  public String detail(@RequestParam int menuNo, Model model) {
    System.out.println(menuNo);
    Menu menu = menuService.selectOne(menuNo);
    model.addAttribute("menu", menu);
    return "menu/";
  }
  
  @RequestMapping("delete")
  public String delete(@RequestParam int menuNo) {
    menuService.delete(menuNo);
    return "redirect:../menu/list";
  }
  
}
