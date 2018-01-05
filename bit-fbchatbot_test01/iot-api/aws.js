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

dev01.on('connect', function() {

    console.log('AWS IoT의 장비와 연결 되었음!');
    devices['dev01'] = dev01;
});

function publish(deviceName, topic, dataObj){
    devices[deviceName].publish(topic, JSON.stringify(dataObj));

}

module.exports = {
  publish
};
