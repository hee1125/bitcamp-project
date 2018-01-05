const http = require('http') // 로컬 테스트용
//const https = require('https') // 운영 서버용
const express = require('express')
const fs = require('fs')
const bodyParser = require('body-parser');
const request = require('request')

// .env 파일의 내용을 로딩한다.
// require('dotenv').config({path: '/home/ec2-user/vars/.env'})

const app = express();

// View engine
app.set('view engine', 'pug');

// 클라이언트에서 정적 웹자원을 요청했을 때 그 자원을 찾을 폴더를 지정한다.
// 정적 웹자원:
// => 실행하지 않고 그대로 읽어서 클라이언트에게 보내는 파일
// => .html, .gif, .jpg, .css, .js 등
app.use(express.static(__dirname + '/public'));

// JSON 형식으로 클라이언트가 보낸 데이터를 처리하는 객체 등록
// => 이 객체를 등록하지 않으면 JSON 형식으로 전달 받은 데이터를 다룰 수 없다.
app.use(bodyParser.json());

// URL 인코딩 형식으로 클라이언트가 보낸 데이터를 처리하는 객체 등록
// => 이 객체를 등록하지 않으면 URL 인코딩 형식으로 전달 받은 데이터를 다룰 수 없다.
app.use(bodyParser.urlencoded({extended: true}));

/*
// node-aREST
var rest = require("arest")(app);
rest.addDevice ('http', '192.168.10.137')
// rest.addDevice('http','192.168.10.136');
*/
// rest 에 들어오는 데이터 값 확인 또는 통신하는 ip 확인

/*
app.get('/sensor_module/temperature', function(json_data) {
    $("#temperature").text('Temperature:' + json_data.temperature + '°C');
})

app.get('/sensor_module/humidity', function(json_data) {
    $("#humidity").text('humidity:' + json_data.humidity + '%');
})
*/


app.use('/sensor', require('./routes/sensor'));
//app.use('/rasp_ardu_subscribe', require('./rasp_ardu_subscribe'));
/*
app.get('/', function(req, res) {
    res.render('interface');
});
*/
// 로컬 테스트용
http.createServer(app).listen(3000, function() {
  console.log('서버가 시작되었습니다!');

})



// Start server
/*
var server = app.listen(3000, function() {
    console.log('Listening on port %d', server.address().port);
});
*/

// 인증서 데이터를 로딩
// => 다음 객체는 node HTTPS 서버를 실행할 때 사용한다.
// 운영 서버용
/*
var options = {
  key: fs.readFileSync('/home/ec2-user/vars/custom.key'),
  cert: fs.readFileSync('/home/ec2-user/vars/www_eomcs_com.crt'),
  ca: fs.readFileSync('/home/ec2-user/vars/www_eomcs_com.ca-bundle')
}

https.createServer(options, app).listen(9999, function() {
    console.log('서버가 시작되었습니다!')
})
*/
