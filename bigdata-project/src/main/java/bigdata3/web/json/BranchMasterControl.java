package bigdata3.web.json;

import static bigdata3.web.json.JsonResult.STATE_FAIL;
import static bigdata3.web.json.JsonResult.STATE_SUCCESS;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bigdata3.domain.BranchMaster;
import bigdata3.service.BranchMasterService;

@RestController("json.BranchMasterControl")
@RequestMapping("branchMaster/json")
public class BranchMasterControl {
	
	@Autowired BranchMasterService branchMasterService;
	@Autowired ServletContext servletContext;
	
	
	@RequestMapping("add")
	public Object add(
			BranchMaster branchMaster) throws Exception{
		try {
			branchMasterService.add(branchMaster);
			return new JsonResult(STATE_SUCCESS, null);
		
		}catch (Exception e) {
			return new JsonResult(STATE_FAIL, e.getMessage());
		}
	}
	
	@RequestMapping("delete")
	public Object delete(int no) throws Exception{
		try {
			branchMasterService.remove(no);
			return new JsonResult(STATE_SUCCESS, null);
		
		}catch (Exception e) {
			return new JsonResult(STATE_FAIL, e.getMessage());
		}
	}
	
//	@RequestMapping("detail")
//	public Object detail(int no) throws Exception{
//		try {
//			BranchMaster branchMaster = branchMasterService.get(no);
//			
//			return new JsonResult(STATE_SUCCESS, branchMaster);
//		}catch (Exception e) {
//			return new JsonResult(STATE_FAIL, e.getMessage());
//		}
//	}
	
	@RequestMapping("list")
	public Object list(
			@RequestParam(defaultValue="1") int pageNo,
			@RequestParam(defaultValue="5") int pageSize)throws Exception{
		try {
			return new JsonResult(STATE_SUCCESS,
					branchMasterService.list(pageNo, pageSize));
		} catch (Exception e) {
			return new JsonResult(STATE_FAIL, e.getMessage());
		}
	}
	
	@RequestMapping("update")
	public Object update(
	    BranchMaster branchMaster) throws Exception {
	  try {
	    
	    branchMasterService.update(branchMaster);
	    return new JsonResult(STATE_SUCCESS, null);
	      
	  } catch (Exception e) {
	    return new JsonResult(STATE_FAIL, e.getMessage());
	  }
	}
}
