const api = require('./api');
const sendAPI = require('./send');
const openAPI = require('../rest-api/openapi');
const awsIoT = require('../iot-api/aws')


//message를 받았을 때 그 메시지를 처리할 함수를 보관하는 빈 객체.
const messageHandler = {
};

const addMessage = (message, handler) => {
  messageHandler[message] = handler;
}

// 등록된 메시지 핸들러를 찾아서 리턴한다
const getHandler = (message) => {
  for (var key in messageHandler) { // 반복문을 돌면서 key(=message) 값을 처리할 메시지가 있나 확인
    if (message.indexOf(key) != -1) { // -1이 아니라면 true
        /*
        if (message.indexOf(key) && message.indexOf(key) != -1) {
         return messageHandler[key]; // key값이 있는 메시지 나옴.
        }
        */
      return messageHandler[key]; // key값이 있는 메시지 나옴.
    }
  }
  return null;
};

/*
addMessage('help', (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      "attachment": {
        "type": "template",
        "payload": {
          "template_type": "button",
          "text": "메뉴",
          "buttons": [
            {
              "type": "postback",
              "title": "LED",
              "payload": "/led"
            },
            {
              "type": "postback",
              "title": "계산기",
              "payload": "/calc"
            },
            {
              "type": "postback",
              "title": "주소검색",
              "payload": "/addr"
            }
          ]
        }
      }
    }
  };
  api.callMessagesAPI(messageData);
});
*/
/*
const signOutButton = { type: 'account_unlink' };

const signInButton = {
  type: 'account_link',
  url: `https://www.bangyeonju.xyz:9999/users/login`
};
*/

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
    //sendAPI.typingOff(recipientId);
    //awsIoT.subscribe('topic_1', 'temp', (msg) => {
    sendAPI.sendTextMessage(recipientId, '현재온도: ' + global.temp + '°C');


    //});

});
/*
    sendAPI.sendTextMessage(recipientId, '현재온도: ')
    awsIoT.subscribe('dev01', 'topic_1', dataObj.temp)

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
  sendAPI.sendTextMessage(recipientId, '현재습도: ' + global.humi + '%');
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

  sendAPI.sendTextMessage(recipientId, '현재미세먼지: ' + global.dust+ '[ug/m3]');
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
/*
addMessage("자주하는 질문", (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },

    message: {
          "text": "아래 중에 궁금하신 내용이 있나요? \n"
          + "1.\n"
          + "2.\n"
          + "3.\n"
          + "4.\n"
          + "5.\n",

          quick_replies:[
            {
              "content_type":"text",
              "title":"1",
              "payload":"1",
            }
          ]
    },
  };

  api.callMessagesAPI(messageData);
})
*/
module.exports = {
  getHandler
};
