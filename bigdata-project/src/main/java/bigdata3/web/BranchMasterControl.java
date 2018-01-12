package bigdata3.web;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import bigdata3.domain.BranchMaster;
import bigdata3.service.BranchMasterService;


@Controller
@RequestMapping("/branchMaster")
public class BranchMasterControl {
	
	@Autowired BranchMasterService branchMasterService;
	@Autowired ServletContext servletContext;
	
	@RequestMapping("list")
	  public String list(
	      @RequestParam(defaultValue="1") int pageNo,
	      @RequestParam(defaultValue="5") int pageSize,
	      Model model) throws Exception {
	    
	    List<BranchMaster> list = branchMasterService.list(pageNo, pageSize);
	    model.addAttribute("list", list);
	    
	    return "branchMaster/list";
	  }
	

}
