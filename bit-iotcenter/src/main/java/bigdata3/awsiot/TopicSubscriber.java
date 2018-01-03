package bigdata3.awsiot;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.amazonaws.services.iot.client.AWSIotMessage;
import com.amazonaws.services.iot.client.AWSIotMqttClient;
import com.amazonaws.services.iot.client.AWSIotQos;
import com.amazonaws.services.iot.client.AWSIotTopic;
import com.amazonaws.services.iot.client.sample.sampleUtil.SampleUtil;
import com.amazonaws.services.iot.client.sample.sampleUtil.SampleUtil.KeyStorePasswordPair;
import com.google.gson.Gson;

@Component
public class TopicSubscriber {
  
  private final String Topic1 = "topic_1";
  private final AWSIotQos Topic1Qos = AWSIotQos.QOS0;
  private AWSIotMqttClient awsIotClient;

  private String clientEndpoint = "a3ag6xqca3ze3x.iot.ap-northeast-2.amazonaws.com";
  private String clientId = "client3";
  
  private String certificateFile = "C://Users/hee/git/bitcamp-project/bit-iotcenter/dev01.cert.pem";
  private String privateKeyFile = "C://Users/hee/git/bitcamp-project/bit-iotcenter/dev01.private.key";
  
  // private String result;
  private double humidity;
  private double temperature;
  private double dustDensityug;
  /*
  public String getResult() {
    return result;
  }
  */
  public double getHumidity() {
    return humidity;
  }
  public double getTemperature() {
    return temperature;
  }
  public double getdustDensityug() {
    return dustDensityug;
  }

  public TopicSubscriber() {
    if (awsIotClient == null && certificateFile != null && privateKeyFile != null) {
      KeyStorePasswordPair pair = SampleUtil.getKeyStorePasswordPair(
          certificateFile, 
          privateKeyFile);
      
      awsIotClient = new AWSIotMqttClient(
          clientEndpoint, 
          clientId, 
          pair.keyStore, 
          pair.keyPassword);
    }

    if (awsIotClient == null) {
        throw new IllegalArgumentException("인증서와 신용장이 유효하지 않아 AWSIotMqttClient 생성 실패!");
    }
    
    try {
      awsIotClient.connect();
      System.out.println("AWS IoT 서버에 연결됨!");
      
      awsIotClient.subscribe(new AWSIotTopic(Topic1, Topic1Qos) {
        @Override
        public void onMessage(AWSIotMessage message) {
          // 이 메서드는 서버에서 메시지를 수신 할 때 마다 호출된다.
          //System.out.println(System.currentTimeMillis() + ": <<< " + message.getStringPayload());
          
          @SuppressWarnings("unchecked")
          Map<String,Object> data = new Gson().fromJson(message.getStringPayload(), Map.class);
          // result = (String)data.get("result");
          humidity = (double)data.get("humi");
          temperature = (double)data.get("temp");
          dustDensityug = (double)data.get("dust");
        }
      }, true);
      
      System.out.printf("'%s' 구독중...", Topic1);
      
    } catch (Exception e) {
      throw new RuntimeException("AWS IoT 서버에 연결 실패!");
    }
  }
  
  /*
  public static void main(String[] args) throws Exception {
    TopicSubscriber subscriber = new TopicSubscriber();
  }
  */
}