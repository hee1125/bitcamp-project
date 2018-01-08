// AWT IoT의 Gateway에 메시지를 보내는 예제
// => 메시지를 보내는 것을 "발행(publish)"이라고 표현한다.

const awsIot = require('aws-iot-device-sdk');

// 장비목록
const devices = {};

// AWS 서버에 등록된 Things 정보를 바탕으로 장비를 준비시킨다.
const dev01 = awsIot.device({

  //AWS 서버에 Thing을 생성한 후 만든 인증서의 개인키 파일
    keyPath:"/home/ec2-user/vars/aws-iot/dev01/dev01.private.key",

  //AWS 서버에 Thing을 생성한 후 만든 인증서의 사물 인증서 파일
    certPath:"/home/ec2-user/vars/aws-iot/dev01/dev01.cert.pem",

  //AWS 서버에 Thing을 생성한 후 만든 인증서를 검증해 줄 "인증서를 발행한 회사"의 인증서 파일
    caPath:"/home/ec2-user/vars/aws-iot/root-CA.crt",

  // 다른 클라ㅏ이언트와 구분하기 위한 임의의 ID
    clientId:"fbchatbot",

  // AWS에 등록한 Thing을 가리키는 URL.
  // AWS IoT 사물 관리 페이지에서 "상호작용" 메뉴에서
  //HTTPS의 RestAPI를 요청할 때 사용할 Thing의 URL이다.
    host: process.env.DEV01_HOST // AWS

});

// 이 프로그램이 AWS IoT에 등록한 Thing과 연결되었을 때 호출될 메서드 추가
dev01.on('connect', function() {
    // 이 함수를 호출되었다는 것은 AWS IoT의 Thing과 연결되었다는 의미다.
    console.log('AWS IoT의 dev01 장비와 연결 되었음!');
    // 연결에 성공하면 연결된 장비를 목록에 추가한다.
    devices['dev01'] = dev01;

    // 연결되면 'topic_1'이라는 사서함을 구독하겠다고 선언한다.
    // => 즉 지금부터 연결된 Thing의 'topic_1'이라는 사서함에
    //    메시지가 오면 받겠다는 의미다.

    dev01.subscribe('topic_1');
    console.log('topic_1의 사서함 구독 시작')

});


// 구독하기로 설정한 사서함에 메시지가 도착할 때 마다
// AWS IoT 서버에 이 프로그램에 알려준다.
// 그때 호출될 메서드를 추가한다.
dev01.on('message', function(topic, payload) {
    console.log('사서함 메시지 도착');
    console.log('사서함 이름:', topic);
    var dataObj = payload.toString('utf-8')
    var obj = JSON.parse(dataObj)
    console.log('받은 메시지:', obj);
    var temp = obj.temp
    console.log(temp);
    global.temp = obj.temp;
    global.humi = obj.humi;
    console.log('-------------------------');

});
/*
function subscribe (deviceName, topic, callback) {
    devices[deviceName].on('message', function(topic, payload) {
        var dataObj = payload.toString('utf-8')
        var obj = JSON.parse(dataObj)
        var temp = obj.temp
        var humi = obj.humi
    // if msg
    callback(temp);
    });
}

*/
function subscribe (message, temp, callback) {
    dev01.on('message', function(topic, payload) {
        var dataObj = payload.toString('utf-8')
        var obj = JSON.parse(dataObj)
        var temp = obj.temp
        var humi = obj.humi
    callback(temp);
    });
}




/*
function subscribe (deviceName, topic, dataObj) {
    devices[deviceName].subscribe(topic, JSON.parse(dataObj))
    var obj = JSON.parse(dataObj)
    var temp = obj.temp
    var humi = obj.humi
    console.log(temp)
}
/*
dict = json.loads(message.payload.decode('UTF-8'))
elif dict['control'] == 'ventilator':
        if dict['value'] == 'on':
            ventilator.onVentilator(True)
        else :
            ventilator.onVentilator(False)

subscribe('dev01', 'topic_1', payload.toString(dataObj))

function publish(deviceName, topic, dataObj){
    devices[deviceName].publish(topic, JSON.stringify(dataObj));
}

awsIoT.publish('dev01', 'topic_2', {
  control: 'humidifier',
  value: 'on'
});


/*
dev01.on('message', function(topic, payload) {
    if ( == "dht") {
        var dht = payload.toString('utf-8');
        var  = JSON.parse(dht);
        console.log(temp);
    }
});

/*
server.on('published', function (packet, client) {
    if (packet.topic == 'presence') {
        var stringBuf = packet.payload.toString('utf-8');
        var obj = JSON.parse(stringBuf);
        console.log(obj);
    }
});
*/
/*
dev01.on('message', function(topic, payload) {
    if (topic.equals('topic_1') & payload.toString("dht"))


});

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
*/
/*
function subscribe(deviceName, topic, payload){
    devices[deviceName].subscribe(topic, payload.toString("sensor").equals("dht"))
            temp : res.query.temp
            humi : res.query.humi

}
*/
/*
var temp = toString(res.query.temp);
var humi = toString(res.query.humi);

subscribe('dev01', 'topic_1', {

        humidity : res.query.temp,
        temperature : res.query.humi,
        dustDensityug : res.query.dust

});
*/
/*
dev01.on('message', function(topic, payload) {
    var dataObj = payload.toString('utf-8')
    var obj = JSON.parse(dataObj)
    var temp = obj.temp
    console.log(temp);
});

function subscribe(deviceName, topic, dataObj){
    devices[deviceName].subscribe(topic, payload.toString(dataObj))
}

subscribe('dev01', 'topic_1', dataObj) {
    var obj = JSON.parse(dataObj)
    var temp = obj.temp
    console.log(temp);
})

*/
/*
function subscribe(deviceName, topic, dataObj) {

    var dataObj = payload.toString('utf-8')
    var obj = JSON.parse(dataObj)
    var temp = obj.temp
    var humi = obj.humi
    devices[deviceName].subscribe(topic, payload.toString(dataObj))
}
*/
function publish(deviceName, topic, dataObj){
    devices[deviceName].publish(topic, JSON.stringify(dataObj));
}

module.exports = {
    subscribe,
    publish
};
