// nodeJS에서 Express 모듈을 사용할 경우
// 다음과 같이 express의 라우터 객체에 클라이언트 요청을 처리할 함수를 등록한다.
// 만약 Express 모듈을 사용하지 않는다면 다음 코드는 무효하다.
//import express from 'express';
const express = require('express')
const fs = require('fs');


// 클라이언트 요청이 들어왔을 때 함수를 호출해주는 객체
const router = express.Router();

const linkAccountToMessenger = (res, username, redirectURI) => {
  /*
    The auth code can be any thing you can use to uniquely identify a user.
    Once the redirect below happens, this bot will receive an account link
    message containing this auth code allowing us to identify the user.

    NOTE: It is considered best practice to use a unique id instead of
    something guessable like a users username so that malicious
    users cannot spoof a link.
   */
  const authCode = uuid();

  // set the messenger id of the user to the authCode.
  // this will be replaced on successful account link
  // with the users id.
  UserStore.linkMessengerAccount(username, authCode);

    // Redirect users to this URI on successful login
  const redirectURISuccess = `${redirectURI}&authorization_code=${authCode}`;

  res.redirect(redirectURISuccess);
};

router.get('/login', function(req, res) {
  /*
    Account Linking Token is never used in this demo, however it is
    useful to know about this token in the context of account linking.

    It can be used in a query to the Graph API to get Facebook details
    for a user. Read More at:
    https://developers.facebook.com/docs/messenger-platform/account-linking
  */
  const accountLinkingToken = req.query.account_linking_token;

  const redirectURI = req.query.redirect_uri;

  res.render('login', {accountLinkingToken, redirectURI});
  console.log('xxxxxxxxxxxxxxxx');
});

router.get('/', (request, response) => {
    console.log('okok')
});

// 라우터 객체에 URL에 대해 호출될 함수를 등록한다.
router.get('/', (request, response) => {
    fs.readFile('login.html', function(error,data){
      response.writeHead(200, {'Content-Type':'text/html'});
      response.end(data);
      console.log('user');
    });
});

router.get('/test1', (request, response) => {
    response.writeHead(200, {
        'Content-Type': 'text/plain;charset=UTF-8'
    })
    response.write('test1...\n')
    response.end()
})

//export default router;
module.exports = router;
