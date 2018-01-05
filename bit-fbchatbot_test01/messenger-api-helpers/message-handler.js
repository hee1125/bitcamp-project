const api = require('./api');
const sendAPI = require('./send');
const openAPI = require('../rest-api/openapi');
// const matches = require("lodash/matches")

//message를 받았을 때 그 메시지를 처리할 함수를 보관하는 빈 객체.
const messageHandler = {
};

// message를 처리할 함수를 등록한다
const addMessage = (message, handler) => {
  messageHandler[message] = handler;
}
// 등록된 메시지 핸들러를 찾아서 리턴한다
const getHandler = (message) => {
  for (var key in messageHandler) { // 반복문을 돌면서 key(=message) 값을 처리할 메시지가 있나 확인
    if (message.indexOf(key) != -1) { // -1이 아니라면 true

      //  if (message.indexOf(key) && message.indexOf(key) != -1) {
      //   return messageHandler[key]; // key값이 있는 메시지 나옴.
      //}
      
      return messageHandler[key]; // key값이 있는 메시지 나옴.
    }
  }
  return null;
};

addMessage("도움말", (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      text: "채팅창에 입력해 보세요 \n"
      + "▶︎ 메뉴\n"
      + "▶︎ 온도\n"
      + "▶︎ 습도\n"
      + "▶︎ 미세먼지\n"
      + "▶︎ 가습기\n"
      + "▶︎ 환풍기\n"
    },
  };
  api.callMessagesAPI(messageData);
})

addMessage('메뉴', (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      "attachment": {
        "type": "template",
        "payload": {
          "template_type": "button",
          "text": "옵션을 보고싶으세요? 아래에서 탭 해주세요.",
          "buttons": [
            {
              "type": "postback",
              "title": "메뉴판",
              "payload": "/board" // 버튼 클릭 시, 서버에 다시 보내지는 값; postback-handler 에 구현
            },
            {
              "type": "postback",
              "title": "매장관리",
              "payload": "/store"
            }
          ],
        },
      }
    }
  };
  sendAPI.typingOn(recipientId);
  api.callMessagesAPI(messageData);
})

addMessage('온도', (recipientId, messageText) => {
  sendAPI.sendTextMessage(recipientId, '현재온도: ');
})
/*
addMessage(('가습기')&&('on'), (recipientId, messageText) => {
  sendAPI.sendTextMessage(recipientId, '가습기 켭니다');
  awsIoT.publish('dev01', 'topic_1', {
    message: 'humidifier on',
    humidifier: 'on'
  });
  //awsIoTShadow.update({humidifier:on});
  })

addMessage(('가습기')&&('off'), (recipientId, messageText) => {
  sendAPI.sendTextMessage(recipientId, '가습기 끕니다');
  awsIoT.publish('dev01', 'topic_1', {
    message: 'humidifier off',
    humidifier: 'off'
  });
  //awsIoTShadow.update({humidifier:off});
  })
  

addMessage(('가습기')&&('키'), (recipientId, messageText) => {
  sendAPI.sendTextMessage(recipientId, '가습기 켭니다');
  awsIoT.publish('dev01', 'topic_1', {
    message: 'humidifier on',
    humidifier: 'on'
  });
  //awsIoTShadow.update({humidifier:on});
  })

addMessage(('가습기')&&('끄'), (recipientId, messageText) => {
  sendAPI.sendTextMessage(recipientId, '가습기 끕니다');
  awsIoT.publish('dev01', 'topic_1', {
    message: 'humidifier off',
    humidifier: 'off'
  });
  //awsIoTShadow.update({humidifier:off});
  })

  addMessage(('가습기')&&('켜'), (recipientId, messageText) => {
    sendAPI.sendTextMessage(recipientId, '가습기 켭니다');
    awsIoT.publish('dev01', 'topic_1', {
      message: 'humidifier on',
      humidifier: 'on'
    });
    //awsIoTShadow.update({humidifier:on});
    })
  
  addMessage(('가습기')&&('꺼'), (recipientId, messageText) => {
    sendAPI.sendTextMessage(recipientId, '가습기 끕니다');
    awsIoT.publish('dev01', 'topic_1', {
      message: 'humidifier off',
      humidifier: 'off'
    });
    //awsIoTShadow.update({humidifier:off});
    })
    


    addMessage(('환풍기')&&('on'), (recipientId, messageText) => {
      sendAPI.sendTextMessage(recipientId, '환풍기 켭니다');
      awsIoT.publish('dev01', 'topic_1', {
        message: 'ventilator on',
        ventilator: 'on'
      });
      //awsIoTShadow.update({ventilator:on});
      
      })
    
    addMessage(('환풍기')&&('off'), (recipientId, messageText) => {
      sendAPI.sendTextMessage(recipientId, '환풍기 끕니다');
      awsIoT.publish('dev01', 'topic_1', {
        message: 'ventilator off',
        ventilator: 'off'
      });
      //awsIoTShadow.update({ventilator:off});
      
      })
      
    
    addMessage(('환풍기')&&('키'), (recipientId, messageText) => {
      sendAPI.sendTextMessage(recipientId, '환풍기 켭니다');
      awsIoT.publish('dev01', 'topic_1', {
        message: 'ventilator on',
        ventilator: 'on'
      });
      //awsIoTShadow.update({ventilator:on});
      
      })
    
    addMessage(('환풍기')&&('끄'), (recipientId, messageText) => {
      sendAPI.sendTextMessage(recipientId, '환풍기 끕니다');
      awsIoT.publish('dev01', 'topic_1', {
        message: 'ventilator off',
        ventilator: 'off'
      });
      //awsIoTShadow.update({ventilator:off});
      
      })
    
      addMessage(('환풍기')&&('켜'), (recipientId, messageText) => {
        sendAPI.sendTextMessage(recipientId, '환풍기 켭니다');
        awsIoT.publish('dev01', 'topic_1', {
          message: 'ventilator on',
          ventilator: 'on'
        });
        //awsIoTShadow.update({ventilator:on});
        
        })
      
      addMessage(('환풍기')&&('꺼'), (recipientId, messageText) => {
        sendAPI.sendTextMessage(recipientId, '환풍기 끕니다');
        awsIoT.publish('dev01', 'topic_1', {
          message: 'ventilator off',
          ventilator: 'off'
        });
        //awsIoTShadow.update({ventilator:off});
        
        })
        */
        
addMessage('습도', (recipientId, messageText) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      "attachment": {
        "type": "template",
        "payload": {
          "template_type": "button",
          "text": "가습기를 제어 하시겠습니까?",
          "buttons": [
            {
              "type": "postback",
              "title": "가습기 on",
              "payload": "/store/humidifier/on"
            },
            {
              "type": "postback",
              "title": "가습기 off",
              "payload": "/store/humidifier/off"
            },
            {
              "type": "postback",
              "title": "메인으로",
              "payload": "/menu"
            }
          ]
        }
      }
    }
  };
  sendAPI.sendTextMessage(recipientId, '현재습도: ');
  
  api.callMessagesAPI(messageData);

})

addMessage("미세먼지", (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      "attachment": {
        "type": "template",
        "payload": {
          "template_type": "button",
          "text": "환풍기 제어 하시겠습니까?",
          "buttons": [
            {
              "type": "postback",
              "title": "환풍기 on",
              "payload": "/store/ventilator/on"
            },
            {
              "type": "postback",
              "title": "환풍기 off",
              "payload": "/store/ventilator/off"
            },
            {
              "type": "postback",
              "title": "메인으로",
              "payload": "/menu"
            }
          ]
        }
      }
    }
  };

  sendAPI.sendTextMessage(recipientId, '현재미세먼지: ');
  api.callMessagesAPI(messageData);
})

addMessage('가습기', (recipientId, messageText) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      "attachment": {
        "type": "template",
        "payload": {
          "template_type": "button",
          "text": "가습기를 제어 하시겠습니까?",
          "buttons": [
            {
              "type": "postback",
              "title": "가습기 on",
              "payload": "/store/humidifier/on"
            },
            {
              "type": "postback",
              "title": "가습기 off",
              "payload": "/store/humidifier/off"
            },
            {
              "type": "postback",
              "title": "메인으로",
              "payload": "/menu"
            }
          ]
        }
      }
    }
  };
  api.callMessagesAPI(messageData);

})

addMessage("환풍기", (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      "attachment": {
        "type": "template",
        "payload": {
          "template_type": "button",
          "text": "환풍기 제어 하시겠습니까?",
          "buttons": [
            {
              "type": "postback",
              "title": "환풍기 on",
              "payload": "/store/ventilator/on"
            },
            {
              "type": "postback",
              "title": "환풍기 off",
              "payload": "/store/ventilator/off"
            },
            {
              "type": "postback",
              "title": "메인으로",
              "payload": "/menu"
            }
          ]
        }
      }
    }
  };

  //sendAPI.typingOn(recipientId);
  api.callMessagesAPI(messageData);
})


module.exports = {
  getHandler,
};

