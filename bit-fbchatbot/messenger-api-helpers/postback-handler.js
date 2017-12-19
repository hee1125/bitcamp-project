// 메신저 서버에게 메시지를 전달해주는 도구 가져오기
const api = require('./api')
const sendAPI = require('./send');
const awsIoT = require('../iot-api/aws');
const awsIoT = require('../iot-api/shadow');

// postback을 받았을 때 그 메시지를 처리할 함수를 보관하는 객체
const postbackHandler = {};

// postback을 처리할 함수를 등록한다.
const addPostback = (postback, handler) => {
    postbackHandler[postback] = handler;
}

// 등록된 메시지를 핸들러를 찾아서 리턴한다
const getHandler = (postback) => {
    return postbackHandler[postback];
};

// '/led' 메시지를 처리할 함수 등록
addPostback('/led', (recipientId) => {
    var messageData = {
      recipient: {
        id: recipientId
      },
      message: {
        "attachment":{
          "type":"template",
          "payload":{
            "template_type":"button",
            "text":"LED 스위치",
            "buttons":[
              {
                "type":"postback",
                "title":"ON",
                "payload":"/led/on"
              },
              {
                "type":"postback",
                "title":"OFF",
                "payload":"/led/off"
              }
            ]
          }
        }
      }
    };

      api.callMessagesAPI(messageData);
    });

addPostback('/led/on', (recipientId) => {
    sendAPI.sendTextMessage(recipientId, "LED를 켜겠습니다.");
    // 나중에 스프링 부트에 LED 켜는 명령을 보낼 것이다.
    /*
    awsIoT.publish('dev01', 'topic_1', {
        message: 'led on',
        led: 'on'});
    */
    awsIoTShadow.update({led:"on"});
});

addPostback('/led/off', (recipientId) => {
    sendAPI.sendTextMessage(recipientId, "LED를 끄겠습니다.");
    // 나중에 스프링 부트에 LED 끄는 명령을 보낼 것이다.
    /*
    awsIoT.publish('dev01', 'topic_1', {
        message: 'led off',
        led: 'off'});
    */
    awsIoTShadow.update({led:"off"});
});

addPostback('/addr', (recipientId) => {
    var messageData = {
      recipient: {
        id: recipientId
      },
      message: {
        "attachment":{
          "type":"template",
          "payload":{
            "template_type":"button",
            "text":"검색항목",
            "buttons":[
              {
                "type":"postback",
                "title":"동이름",
                "payload":"/addr/dong"
              },
              {
                "type":"postback",
                "title":"도로명",
                "payload":"/addr/road"
              },
              {
                "type":"postback",
                "title":"우편번호",
                "payload":"/addr/post"
              }
            ]
          }
        }
      }
    };

  api.callMessagesAPI(messageData);
});

addPostback('/addr/road', (recipientId) => {
    sendAPI.sendTextMessage(recipientId, '동 이름을 입력해주세요~ 예) 신천동');
});

addPostback('/addr/road', (recipientId) => {
    sendAPI.sendTextMessage(recipientId, '도로명을 입력해주세요~ 예) 올림픽로33길 17');
});

addPostback('/addr/post', (recipientId) => {
    sendAPI.sendTextMessage(recipientId, '우편번호를 입력해주세요~ 예) 05509');
});


addPostback('/calc', (recipientId) => {
    sendAPI.sendTextMessage(recipientId, '식을 입력하세요. \n 예) 2 + 3')
});

module.exports = {
    getHandler
};
