package bigdata3.web;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import bigdata3.service.AwsIotService;

@Controller
@RequestMapping("/awsiot/")
public class AwsIotControl {

  @Autowired
  AwsIotService awsIotService;
  
  @RequestMapping("iot_control")
  public String getHumiTempDust(Model model) {
    
    model.addAttribute("message", awsIotService.getMessage());
    
    return "awsiot/iot_control";
  }
  
  @RequestMapping("iot_control_state")
  @ResponseBody
  public String getControlState() {
    return new Gson().toJson(awsIotService.getControlValue());
  }
  
  @RequestMapping("iot_sensor_state")
  @ResponseBody
  public String getSensorState() {
    return new Gson().toJson(awsIotService.getMessage());
  }
  
  
  @RequestMapping("setState")
  @ResponseBody
  public String setState(Model model,
      String device,
      String state) {
      
      model.addAttribute("controlvalue", awsIotService.getControlValue());
    
      HashMap<String,String> valueMap = new HashMap<>();
      valueMap.put("control", device);
      valueMap.put("value", state);
      
      try {
        awsIotService.publish("topic_2", new Gson().toJson(valueMap));
      } catch (Exception e) {
        return "fail";
      } 
      return "ok";
  }
  
}