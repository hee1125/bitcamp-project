package bigdata3.web.json;


import static bigdata3.web.json.JsonResult.STATE_FAIL;
import static bigdata3.web.json.JsonResult.STATE_SUCCESS;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import bigdata3.domain.BranchMaster;
import bigdata3.service.BranchMasterService;

// 이 페이지 컨트롤러는 응답으로 JSON 데이터를 리턴하기 때문에
// @RestController를 붙여야 한다.
@RestController("json.AuthControl")
@RequestMapping("/auth/json") // 기존의 페이지 컨트롤러와 구분하기 위해 URL을 변경한다.
public class AuthControl {
  @Autowired BranchMasterService branchMasterService;
  
  @RequestMapping("login")
  public Object login(
      String email, 
      String password, 
      @RequestParam(defaultValue="branchMaster") String userType,
      HttpSession session) throws Exception {
    
    BranchMaster branchMaster = null;
    if (userType.equals("branchMaster")) {
      branchMaster = branchMasterService.getByEmailPassword(email, password);
    }
    
    if (branchMaster != null) { 
      session.setAttribute("loginBranchMaster", branchMaster);
      return new JsonResult(STATE_SUCCESS, branchMaster);
    } 
    
    return new JsonResult(STATE_FAIL, null);
  }
  
  @RequestMapping("logout")
  public Object logout(HttpServletRequest req, HttpServletResponse res) throws Exception {
    req.getSession().invalidate();  
    return new JsonResult(STATE_SUCCESS, null);
  }  
}









