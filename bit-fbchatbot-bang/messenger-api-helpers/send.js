const api = require('./api')


const typingOn = (recipientId) => {
  const messageData = {
    recipient: {
      id: recipientId,
    },
    sender_action: 'typing_on', // eslint-disable-line camelcase
  };

  api.callMessagesAPI(messageData);
};


// 기존 함수
const sendTextMessage = (recipientId, messageText) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      text: messageText
    },
  };
  api.callMessagesAPI(messageData);
};

const sendWelcomeMessage = (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      text: "안녕하세요 레스토랑 입니다.\n저는 메신저가 편한 고객님들을 위해 새롭게 선보이는 자동채팅 서비스입니다"
    }
  };
  api.callMessagesAPI(messageData);
};
const sendImageMessage = (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      attachment: {
        type: "template",
        payload: {
          template_type: "generic",
          elements: [{
            title: "메인 메뉴 사진",
            subtitle: "메뉴 사진",
            image_url: "http://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84-765x519.jpg",

            buttons: [{
              type: "web_url",
              url: "http://www.jawsfood.co.kr/?page_id=202",
              title: "사이트 방문"
            },{
              type: "postback",
              payload: "/menu",
              title: "메인으로"
            }]

          }]
        }
      }
    }
  };
  api.callMessagesAPI(messageData);
};

const sendGenericMessage = (recipientId) => {
  var messageData = {
    recipient: {
      id: recipientId
    },
    message: {
      attachment: {
        type: "template",
        payload: {
          template_type: "generic",
          elements: [{
            title: "이벤트 메뉴 사진 1",
            subtitle: "12월달 신메뉴",
            image_url: "http://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84-765x519.jpg",

            buttons: [{
              type: "web_url",
              url: "http://www.jawsfood.co.kr/?page_id=202",
              title: "사이트 방문"
            },{
              type: "postback",
              payload: "/menu",
              title: "메인으로"
            }
          ]

          }, {
            title: "이벤트 메뉴 사진 2",
            subtitle: "할인 이벤트",
            image_url: "http://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84-765x519.jpg",

            buttons: [{
              type: "web_url",
              url: "http://www.jawsfood.co.kr/?page_id=206",
              title: "사이트 방문"
            },{
              type: "postback",
              payload: "/menu",
              title: "메인으로"
            }]

          },{
            title: "이벤트 메뉴 사진 3",
            subtitle: "적립 이벤트",
            image_url: "http://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84-765x519.jpg",

            buttons: [{
              type: "web_url",
              url: "http://www.jawsfood.co.kr/?page_id=202",
              title: "사이트 방문"
            },{
              type: "postback",
              payload: "/menu",
              title: "메인으로"
            }]

          },{
            title: "이벤트 메뉴 사진 4",
            subtitle: "공짜 이벤트",
            image_url: "http://www.bloter.net/wp-content/uploads/2016/08/%EC%8A%A4%EB%A7%88%ED%8A%B8%ED%8F%B0-%EC%82%AC%EC%A7%84-765x519.jpg",

            buttons: [{
              type: "web_url",
              url: "http://www.jawsfood.co.kr/?page_id=206",
              title: "사이트 방문"
            },{
              type: "postback",
              payload: "/menu",
              title: "메인으로"
            }]

          }]
        }
      }
    }
  };
  api.callMessagesAPI(messageData);
};


module.exports = {

  sendTextMessage,
  sendGenericMessage,
  sendImageMessage,
  typingOn,
  sendWelcomeMessage


};
