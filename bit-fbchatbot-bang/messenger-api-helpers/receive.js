const sendAPI = require('./send');
const openAPI = require('../rest-api/openapi');
const messageHandler = require('./message-handler');
const postbackHandler = require('./postback-handler');

const handleReceiveMessage = (event) => {
    var senderID = event.sender.id;
    var recipientID = event.recipient.id;
    var timeOfMessage = event.timestamp;
    var message = event.message;
    console.log("Received message for user %d and page %d at %d with message:",
      senderID, recipientID, timeOfMessage);

    var messageId = message.mid;
    var messageText = message.text;
    var messageAttachments = message.attachments;
    var menu = global[senderID].menu; // 사용자의 현재 메뉴

    var handler = messageHandler.getHandler(messageText);

    // sendAPI.typingOn(senderID);
    if(handler) { // 메시지를 처리할 함수가 있다면
      handler(senderID); // 그함수 호츨
    } else {
      sendAPI.sendTextMessage(senderID, '유효한 명령이 아닙니다.');
      setTimeout(function() {
        handler = messageHandler.getHandler("도움말")
        handler(senderID)
      }, 1000);
    }
  };

const handleReceivePostback = (event) => {

  var senderID = event.sender.id;
  var recipientID = event.recipient.id;
  var timeOfPostback = event.timestamp;
  var payload = event.postback.payload;
  var message = event.message;

  console.log("Received postback for user %d and page %d with payload '%s' " +
    "at %d", senderID, recipientID, payload, timeOfPostback);

  var handler = postbackHandler.getHandler(payload);

  if (handler) {
    global[senderID].menu = payload;
    handler(senderID);
  }
    else {
    sendAPI.sendWelcomeMessage(senderID);
    setTimeout(function() {
      handler = messageHandler.getHandler("도움말")
      handler(senderID)
    }, 1000);

  }
};

module.exports = {
  handleReceiveMessage,
  handleReceivePostback

};
