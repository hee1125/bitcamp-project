package bigdata3.web.json;

import static bigdata3.web.json.JsonResult.STATE_SUCCESS;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import bigdata3.domain.Device;
import bigdata3.service.DeviceService;
import bigdata3.util.EmailAgent;

@RestController("json.DeviceControl")
@RequestMapping("/json/iot/")
public class DeviceControl {

  @Autowired ServletContext application;
  
  @Autowired EmailAgent emailAgent;
  
  @Autowired DeviceService deviceService;
  
  @RequestMapping("{deviceType}/status/{fbUserId}")
  public Object status(
      @PathVariable String deviceType,
      @PathVariable String fbUserId) throws Exception {
    
    List<Device> devices = deviceService.list(fbUserId, deviceType);
    
    return new JsonResult(STATE_SUCCESS, devices);
  }
  
}

/* 사용법
[장비등록]
=> http://localhost:8080/device/json/reset/시리얼번호
 */







