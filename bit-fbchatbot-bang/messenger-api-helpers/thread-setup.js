// 메신저 서버에게 메시지를 전달해 주는 도구 가져오기
const sendAPI = require('./send');
const api = require("./api")
/**
 * setGetStarted - Sets the Get Started button for the application
 *
 * @returns {undefined}
 */
const setGetStarted = () => {
  api.callThreadAPI(sendAPI.getStarted);
};
module.exports = {
  setGetStarted
}
