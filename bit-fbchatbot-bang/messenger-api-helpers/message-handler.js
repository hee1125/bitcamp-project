const api = require('./api');
const sendAPI = require('./send');
const openAPI = require('../rest-api/openapi');

//message를 받았을 때 그 메시지를 처리할 함수를 보관하는 빈 객체.
const messageHandler = {
};

const addMessage = (message, handler) => {
  messageHandler[message] = handler;
}

const getHandler = (message) => {
  return messageHandler[message];
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
      // + "▶︎ 자주하는 질문\n",
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
            },
           // signOutButton
          ],
        },
      }
    }
  };
  api.callMessagesAPI(messageData);
})
addMessage('온도', (recipientId, messageText) => {

   //sendAPI.typingOff(recipientId);
  sendAPI.sendTextMessage(recipientId, '현재온도: ');

})

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
              "payload": "/store/humidity/on"
            },
            {
              "type": "postback",
              "title": "가습기 off",
              "payload": "/store/humidity/off"
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
              "payload": "/store/dust/on"
            },
            {
              "type": "postback",
              "title": "환풍기 off",
              "payload": "/store/dust/off"
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
