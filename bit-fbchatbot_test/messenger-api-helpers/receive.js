

const sendAPI = require('./send');
const openAPI = require('../rest-api/openapi')
const messageHandler = require('./message-handler')
const postbackHandler = require('./postback-handler')

const handleReceiveAccountLink = (event) => {
  const senderId = event.sender.id;

  /* eslint-disable camelcase */
  const status = event.account_linking.status;
  const authCode = event.account_linking.authorization_code;
  /* eslint-enable camelcase */

  console.log('Received account link event with for user %d with status %s ' +
    'and auth code %s ', senderId, status, authCode);

  switch (status) {
  case 'linked':
    const linkedUser = UserStore.replaceAuthToken(authCode, senderId);
    sendApi.sendSignInSuccessMessage(senderId, linkedUser.username);
    break;
  case 'unlinked':
    UserStore.unlinkMessengerAccount(senderId);
    sendApi.sendSignOutSuccessMessage(senderId);
    break;
  default:
    break;
  }
};

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


    var menu = global[senderID].menu; // 사용자의 현재메뉴

    // 사용자가 클릭한 버튼을 처리할 함수를 꺼낸다.
    var handler = messageHandler.getHandler(messageText);



    if (handler) { // 메시지를 처리할 함수가 있다면,
        handler(senderID); // 그 함수를 호출한다.
    } else if (menu) { // 메뉴의 메시지를 처리할 함수를 꺼낸다.
        handler = messageHandler.getHandler(menu);
        handler(senderID, messageText);

    } else if (message.text) {
        sendApi.sendWelcomeMessage(senderId);

    } else {
        sendAPI.sendTextMessage(senderID, '유효한 명령이 아닙니다.')
    }
};

    /*
    if (messageText == 'help') {
        sendAPI.sendMenuMessage(senderID);
        // 현재 help를 출력한 상태임을 저장한다.
        global[senderID].menu = 'help';

    } else if (menu == 'calc') {
        menuCalc(senderID, messageText);
    } else if (menu.startsWith('addr_')) { // 동, 도로명, 우편번호를 검색한다면,
        try {
            var type = menu.substring(5);
            var searchWord = messageText;
            // var arr = messageText.split(':')[1].split('=');
            openAPI.searchNewAddress(type, searchWord, (msg) => {
            //openAPI.searchNewAddress(arr[0], arr[1],(msg)=>{
                sendAPI.sendTextMessage(senderID, msg);
            });
        } catch (err) {
            sendAPI.sendTextMessage("주소검색을 할 수 없습니다.")
            console.log(err);
        }
    } else {
        sendAPI.sendTextMessage(senderID, messageText);
    } */

const handleReceivePostback = (event) => {
    var senderID = event.sender.id;
    var recipientID = event.recipient.id;
    var timeOfPostback = event.timestamp;
    var payload = event.postback.payload;

    console.log("Received postback for user %d and page %d with payload '%s' " +
      "at %d", senderID, recipientID, payload, timeOfPostback);

    // 사용자가 클릭한 버튼의 postback을 처리할 함수를 꺼낸다.
    var handler = postbackHandler.getHandler(payload);

    /**
 * The 'payload' param is a developer-defined field which is
 * set in a postbackbutton for Structured Messages.
 *
 * In this case we've defined our payload in our postback
 * actions to be a string that represents a JSON object
 * containing `type` and `data` properties. EG:
 */
    const {type} = JSON.parse(event.postback.payload);

    // Perform an action based on the type of payload received.
    switch (type) {
    case 'GET_STARTED':
        sendApi.sendWelcomeMessage(senderId);
        break;
    default:
        console.error(`Unknown Postback called: ${type}`);
        break;
    }


    if (handler) { // postback을 처리할 함수가 있다면,
        global[senderID].menu = payload;
        handler(senderID); // 그 함수를 호출한다.
    } else {
        sendAPI.sendTextMessage(senderID, '유효한 명령이 아닙니다.');
    }

};

module.exports = {
    handleReceiveAccountLink,
    handleReceiveMessage,
    handleReceivePostback
};
