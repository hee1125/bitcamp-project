
import messages from './messages';


// 메신저 서버에게 메시지를 전달해주는 도구 가져오기
const api = require('./api')


// Turns typing indicator on.
const typingOn = (recipientId) => {
  return {
    recipient: {
      id: recipientId,
    },
    sender_action: 'typing_on', // eslint-disable-line camelcase
  };
};

// Turns typing indicator off.
const typingOff = (recipientId) => {
  return {
    recipient: {
      id: recipientId,
    },
    sender_action: 'typing_off', // eslint-disable-line camelcase
  };
};

// Wraps a message json object with recipient information.
const messageToJSON = (recipientId, messagePayload) => {
  return {
    recipient: {
      id: recipientId,
    },
    message: messagePayload,
  };
};

// Send one or more messages using the Send API.
const sendMessage = (recipientId, messagePayloads) => {
  const messagePayloadArray = castArray(messagePayloads)
    .map((messagePayload) => messageToJSON(recipientId, messagePayload));

  api.callMessagesAPI(
    [
      typingOn(recipientId),
      ...messagePayloadArray,
      typingOff(recipientId),
    ]);
};

// Send a welcome message for a non signed-in user.
const sendLoggedOutWelcomeMessage = (recipientId) => {
  sendMessage(
    recipientId, [
      {
        text: 'Hi! Welcome to Jasper’s Market!'
          + ' (Messenger Platform Account Linking demo)',
      },
      messages.createAccountMessage,
    ]
  );
};

// Send a welcome message for a signed in user.
const sendLoggedInWelcomeMessage = (recipientId, username) => {
  sendMessage(
    recipientId,
    [
      messages.napMessage,
      messages.loggedInMessage(username),
    ]);
};

// Send a different Welcome message based on if the user is logged in.
const sendWelcomeMessage = (recipientId) => {
  const userProfile = UserStore.getByMessengerId(recipientId);
  if (!isEmpty(userProfile)) {
    sendLoggedInWelcomeMessage(recipientId, userProfile.username);
  } else {
    sendLoggedOutWelcomeMessage(recipientId);
  }
};

// Send a successfully signed in message.
const sendSignOutSuccessMessage = (recipientId) =>
  sendMessage(recipientId, messages.signOutSuccessMessage);

// Send a successfully signed out message.
const sendSignInSuccessMessage = (recipientId, username) => {
  sendMessage(
    recipientId,
    [
      messages.signInGreetingMessage(username),
      messages.signInSuccessMessage,
    ]);
};

// Send a read receipt to indicate the message has been read
const sendReadReceipt = (recipientId) => {
  const messageData = {
    recipient: {
      id: recipientId,
    },
    sender_action: 'mark_seen', // eslint-disable-line camelcase
  };

  api.callMessagesAPI(messageData);
};





const sendTextMessage = (recipientId, messageText) => {
    var messageData = {
      recipient: {
        id: recipientId
      },
      message: {
        text: messageText
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
        "attachment":{
          "type":"image",
          "payload":{
          "url":"http://ppss.kr/wp-content/uploads/2016/04/%ED%8A%B8%EB%9F%BC%ED%94%8401-549x411.jpg",
          "is_reusable":true
          }
        }
      }
    };

    api.callMessagesAPI(messageData);
};

const sendButton1Message = (recipientId) => {
    var messageData = {
      recipient: {
        id: recipientId
      },
      message: {
        "attachment":{
          "type":"template",
          "payload":{
            "template_type":"button",
            "text":"검색 사이트를 선택해주세요!",
            "buttons":[
              {
                "type":"web_url",
                "url":"https://www.google.com",
                "title":"구글"
              },
              {
                "type":"web_url",
                "url":"https://www.naver.com",
                "title":"네이버"
              },
              {
                "type":"web_url",
                "url":"https://www.yahoo.com",
                "title":"야후"
              },
            ]
          }
        }
      }
    };

    api.callMessagesAPI(messageData);
};

const sendButton2Message = (recipientId) => {
    var messageData = {
      recipient: {
        id: recipientId
      },
      message: {
        "attachment":{
          "type":"template",
          "payload":{
            "template_type":"button",
            "text":"검색 사이트를 선택해주세요!",
            "buttons":[
              {
                "type":"phone_number",
                "title":"내 전화번호",
                "payload":"+820000000"
              }
            ]
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
              title: "rift",
              subtitle: "Next-generation virtual reality",
              item_url: "https://www.oculus.com/en-us/rift/",
              image_url: "http://messengerdemo.parseapp.com/img/rift.png",
              buttons: [{
                type: "web_url",
                url: "https://www.oculus.com/en-us/rift/",
                title: "Open Web URL"
              }, {
                type: "postback",
                title: "Call Postback",
                payload: "Payload for first bubble",
              }],
            }, {
              title: "touch",
              subtitle: "Your Hands, Now in VR",
              item_url: "https://www.oculus.com/en-us/touch/",
              image_url: "http://messengerdemo.parseapp.com/img/touch.png",
              buttons: [{
                type: "web_url",
                url: "https://www.oculus.com/en-us/touch/",
                title: "Open Web URL"
              }, {
                type: "postback",
                title: "Call Postback",
                payload: "Payload for second bubble",
              }]
            }]
          }
        }
      }
    };

  api.callMessagesAPI(messageData);
};


module.exports = {
    sendTextMessage

    sendMessage,
    sendWelcomeMessage,
    sendSignOutSuccessMessage,
    sendSignInSuccessMessage,
    sendReadReceipt
};
