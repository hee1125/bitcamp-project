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

  private String certificateFile = "/home/ec2-user/vars/aws-iot/dev01/dev01.cert.pem";
  private String privateKeyFile = "/home/ec2-user/vars/aws-iot/dev01/dev01.private.key";

  // private String result;
  private String humidity;
  private String temperature;
  private String dustDensityug;
  /*
  public String getResult() {
    return result;
  }
  */
  public String getHumidity() {
    return humidity;
  }
  public String getTemperature() {
    return temperature;
  }
  public String getdustDensityug() {
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

            if (data.get("sensor").equals("dht")) {
                humidity = (String)data.get("humi");
                temperature = (String)data.get("temp");
            } else if (data.get("sensor").equals("dust")) {
                dustDensityug = (String)data.get("dust");
            }


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
