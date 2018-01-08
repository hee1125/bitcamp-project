
package bigdata3.service;

import java.util.Map;

import com.amazonaws.services.iot.client.AWSIotException;


public interface AwsIotService {
  public Map<String,Object> getMessage();
  public Map<String,Object> getPublish();
  // public void publish(String topic, String payload) throws AWSIotException;
  
}