
package bigdata3.service;

import java.util.Map;

import com.amazonaws.services.iot.client.AWSIotException;


public interface AwsIotService {
  public Map<String,Object> getMessage();
  public Map<String,Object> getControlValue();
//  public void publish(String payload) throws AWSIotException;
  public void publish(String topic, String payload) throws AWSIotException;
  
}