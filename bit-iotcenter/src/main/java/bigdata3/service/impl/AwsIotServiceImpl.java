package bigdata3.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amazonaws.services.iot.client.AWSIotException;

import bigdata3.awsiot.TopicPublisher;
import bigdata3.awsiot.TopicSubscriber;
import bigdata3.service.AwsIotService;

@Service
public class AwsIotServiceImpl implements AwsIotService {

  @Autowired
  TopicSubscriber topicSubscriber;
  TopicPublisher topicPublisher;
  
  @Override
  public Map<String, Object> getMessage() {
    Map<String,Object> message = new HashMap<>();
    message.put("humidity", topicSubscriber.getHumidity());
    message.put("temperature", topicSubscriber.getTemperature());
    message.put("dustDensityug", topicSubscriber.getdustDensityug());
    return message;
  }
  
  @Override
  public Map<String, Object> getPublish() {
    Map<String,Object> publish = new HashMap<>();
    publish.put("humidifier", topicPublisher.getHumidifier());
    publish.put("ventilator", topicPublisher.getVentilator());
    return publish;
  }
  
  /*
  @Override
  public publish(String topic, String payload) throws AWSIotException {
    Map<String,Object> message = new HashMap<>();
    message.put("humidifier", topicPublisher.getHumidifier());
    message.put("ventilator", topicPublisher.getVentilator());

 }
  */

}


