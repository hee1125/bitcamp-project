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

var sensor_value
var temp_value
var humi_value
var dust_value

function getSensor_value() {
  return sensor_value;
}
function getTemp_value() {
  return temp_value;
}
function getHumi_value() {
  return humi_value;
}
function getDust_value() {
  return dust_value;
}


// 구독하기로 설정한 사서함에 메시지가 도착할 때 마다
// AWS IoT 서버에 이 프로그램에 알려준다.
// 그때 호출될 메서드를 추가한다.
dev01.on('message', function(topic, payload) {
    console.log('사서함 메시지 도착');
    console.log('사서함 이름:', topic);
    var dataObj = payload.toString('utf-8')
    var obj = JSON.parse(dataObj)

    var sensor = obj.sensor
    var temp = obj.temp
    var humi = obj.humi
    var dust = obj.dust

    global.sensor = obj.sensor;
    global.temp = obj.temp;
    global.humi = obj.humi;
    global.dust = obj.dust;

    sensor_value = global.sensor;
    temp_value = global.temp;
    humi_value = global.humi;
    dust_value = global.dust;

    /*
        var temp = obj.temp
        var humi = obj.humi
        var dust = obj.dust
        global.temp = obj.temp;
        global.humi = obj.humi;
        global.dust = obj.dust;
    */

console.log('받은 메시지:', obj);

console.log(getTemp_value());
console.log(humi_value);
console.log(global.dust);

console.log('-------------------------');
});

/*
        var temp = obj.temp
        var humi = obj.humi
        var dust = obj.dust
        global.temp = obj.temp;
        global.humi = obj.humi;
        global.dust = obj.dust;
        //console.log(global.temp);
        //console.log(global.humi);
        //console.log(global.dust);
    console.log('-------------------------');
*/

function subscribe (message, sensor_value, callback) {
    dev01.on('message', function(topic, payload) {
        var dataObj = payload.toString('utf-8')
        var obj = JSON.parse(dataObj)

        var sensor = obj.sensor
        var temp = obj.temp
        var humi = obj.humi
        var dust = obj.dust

        global.sensor = obj.sensor;
        global.temp = obj.temp;
        global.humi = obj.humi;
        global.dust = obj.dust;

        sensor_value = global.sensor;
        temp_value = global.temp;
        humi_value = global.humi;
        dust_value = global.dust;

        var objmap = new Map();
            if (obj.get('sensor', obj.sensor == 'dht')) {
                objmap.set('sensor', obj.sensor)
                temp_value = objmap.set('temp', obj.temp)
                humi_value = objmap.set('humi', obj.humi)
            } else if (obj.get('sensor', obj.sensor == 'dust')) {
                objmap.set('sensor', obj.sensor)
                dust_value = objmap.set('dust', obj.dust)
            }
            /*
            var objmap_dht = new Map();
                if (sensor_value == 'dht') {
                    objmap_dht.set('sensor_value', sensor_value)
                    objmap_dht.set('temp_value', temp_value)
                    objmap_dht.set('humi_value', humi_value)
                }
            var objmap_dust = new Map();
                if (sensor_value == 'dust') {
                    objmap_dht.set('sensor_value', sensor_value)
                    objmap_dust.set('dust_value', dust_value)
                }
*/
    //console.log(objmap);
    //console.log(objmap_dht);
    //console.log(objmap_dust);
    callback();
    });
}

function publish(deviceName, topic, dataObj){
    devices[deviceName].publish(topic, JSON.stringify(dataObj));
}

module.exports = {
    subscribe,
    publish
};
