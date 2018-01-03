package bigdata3.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bigdata3.awsiot.TopicSubscriber;
import bigdata3.service.AwsIotService;

@Service
public class AwsIotServiceImpl implements AwsIotService {

  @Autowired
  TopicSubscriber topicSubscriber;
  
  @Override
  public Map<String, Object> getMessage() {
    Map<String,Object> message = new HashMap<>();
    message.put("humidity", topicSubscriber.getHumidity());
    message.put("temperature", topicSubscriber.getTemperature());
    message.put("dustDensityug", topicSubscriber.getdustDensityug());
    return message;
  }
  
}


