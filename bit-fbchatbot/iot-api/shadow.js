// AWS IoT의 Gateway에 메시지를 보내는 예제
// => 메시지를 보내는 것을 "발행(publish)"이라고 표현한다.

// AWS에서 제공하는 nodeJS 모듈을 로딩한다.
const awsIot = require('aws-iot-device-sdk');

// 섀도우에 등록할 장비명
const thingName = 'dev01';

// AWS IoT 서버에 등록된 Thing 정보를 바탕으로 Shadow 제어 장비를 준비시킨다.
var thingShadows = awsIot.thingShadow({
    /* AWS 서버에 Thing을 생성한 후 만든 인증서의 개인키 파일*/
    keyPath: "/home/ec2-user/vars/aws-iot/dev01/dev01.private.key",

    /* AWS 서버에 Thing을 생성한 후 만든 인증서의 사물인증서 파일*/
    certPath: "/home/ec2-user/vars/aws-iot/dev01/dev01.cert.pem",

    /* 사물에 대해 발행한 인증서를 검증해 줄
       "인증서를 발행한 회사"의 인증서 파일
       즉 인증 기관에 대한 인증서 파일*/
    caPath: "/home/ec2-user/vars/aws-iot/root-CA.crt",

    /* 다른 클라이언트와 구분하기 위한 임의의 ID */
    clientId: "client2",

    /* AWS에 등록한 Thing을 가리키는 URL.
       AWS IoT 사물 관리 페이지에서 "상호작용" 메뉴에서
       HTTPS의 RestAPI를 요청할 때 사용할 Thing의 URL이다.*/
    host: "a3ag6xqca3ze3x.iot.ap-northeast-2.amazonaws.com"
 });

 // Thing의 섀도우 제어 장비가 준비되었을 때 호출될 함수 등록
thingShadows.on('connect', function() {
     // 이 함수를 호출되었다는 것은 AWS IoT의 Thing과 연결되었다는 의미다.
     console.log('섀도우 장비가 준비되었다.');

     // 지정된 Thing에 대해 섀도우 연결을 요청한다.
     // => Shadow 생성에 성공한다면 설정된 함수가 호출될 것이다.
     thingShadows.register(thingName, {}, function() {
         console.log('섀도우에 연결하였음!');
     });
 });

 // Thing의 Shadow에 대해 명령을 지시하고 그 명령을 수행한 후에 호출될 함수 등록
thingShadows.on('status',
     function(thingName, stat, clientToken, stateObject) {
         console.log('received '+stat+' on '+thingName+': '+
                 JSON.stringify(stateObject));
 });

 // 지정된 타임아웃 시간이 경과했을 떄 호출될 함수 등록
thingShadows.on('timeout',
     function(thingName, clientToken) {
        console.log('received timeout on '+thingName+
                    ' with token: '+ clientToken);
 });

function update(desiredState) {
    thingShadows.update(thingName, {state: {desired:{led: "off"}}});
}



module.exports = {
    update
};
