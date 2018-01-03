package bigdata3.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import bigdata3.service.AwsIotService;

@Controller
@RequestMapping("/awsiot")
public class AwsIotControl {

  @Autowired
  AwsIotService awsIotService;
  
  @RequestMapping("iot_control")
  public String getHumiTemp(Model model) {
    
    model.addAttribute("message", awsIotService.getMessage());
    
    return "awsiot/iot_control";
  }
  
}