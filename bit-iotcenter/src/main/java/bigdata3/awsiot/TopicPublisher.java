package bigdata3.awsiot;

import java.util.Map;

import org.springframework.stereotype.Component;

import com.amazonaws.services.iot.client.AWSIotMqttClient;
import com.amazonaws.services.iot.client.AWSIotQos;
import com.amazonaws.services.iot.client.sample.sampleUtil.SampleUtil;
import com.amazonaws.services.iot.client.sample.sampleUtil.SampleUtil.KeyStorePasswordPair;
import com.google.gson.Gson;

@Component
public class TopicPublisher {

  private final String Topic2 = "topic_2";
  private final AWSIotQos Topic2Qos = AWSIotQos.QOS0;
  private AWSIotMqttClient awsIotClient;

  private String clientEndpoint = "a3ag6xqca3ze3x.iot.ap-northeast-2.amazonaws.com";
  private String clientId = "client3";

  private String certificateFile = "/home/ec2-user/vars/aws-iot/dev01/dev01.cert.pem";
  private String privateKeyFile = "/home/ec2-user/vars/aws-iot/dev01/dev01.private.key";

  // private String result;
  private String humidifier;
  private String ventilator;
  /*
  public String getResult() {
    return result;
  }
  */
  public String getHumidifier() {
    return humidifier;
  }
  public String getVentilator() {
    return ventilator;
  }


  public TopicPublisher() {
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


      
      @SuppressWarnings("unchecked")
      Map<String,Object> data = new Gson().fromJson(publish.getStringPayload(), Map.class);
  
        if (data.get("control").equals("humidifer")) {
            humidifer = (String)data.get("on");
        } else if (data.get("control").equals("ventilator")) {
            ventilator = (String)data.get("on");
        }
  
      /*
       * 
       * 
       *@Override
        public void publish(String topic, AWSIotQos qos, String payload) throws AWSIotException {
          super.publish(topic, qos, payload);
      }
        
        function publish(deviceName, topic, dataObj){
          devices[deviceName].publish(topic, JSON.stringify(dataObj));
      }
        
        awsIoT.publish('dev01', 'topic_2', {
          control: 'humidifier',
          value: 'on'
        });
      */
      System.out.printf("'%s' 발행중...", Topic2);

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
