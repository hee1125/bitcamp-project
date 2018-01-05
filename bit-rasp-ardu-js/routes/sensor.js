const express = require('express');
const router = express.Router();

const awsIot = require('aws-iot-device-sdk');

const devices = {};

const dev01 = awsIot.device({

    keyPath: "C://workspace01/bit-rasp-ardu-js/dev01.private.key",
    certPath: "C://workspace01/bit-rasp-ardu-js/dev01.cert.pem",
    caPath: "C://workspace01/bit-rasp-ardu-js/root-CA.crt",

    clientId: "sensor",

    // AWS에 등록한 Thing을 가리키는 URL.
    // AWS IoT 사물 관리 페이지에서 "상호작용" 메뉴에서
    // HTTPS의 RestAPI를 요청할 때 사용할 Thing의 URL이다.
    host: "a3ag6xqca3ze3x.iot.ap-northeast-2.amazonaws.com"
    // host: process.env.DEV01_HOST

 });

 // 이 프로그램이 AWS IoT에 등록한 Thing과 연결되었을 때 호출될 메서드 추가
dev01.on('connect', function() {
    // 이 함수를 호출되었다는 것은 AWS IoT의 Thing과 연결되었다는 의미다.
    console.log('AWS IoT의 dev01 장비와 연결 되었음!');
    // 연결에 성공하면 연결된 장비를 목록에 추가한다.
    devices['dev01'] = dev01;
});

router.get('/setTempHumi', (req, res) => {
    console.log('/sensor/set 요청:')
    console.log(req.query.devid)
    console.log(req.query.temp, "°C")
    console.log(req.query.humi, "%")
    res.send('ok')

        publish('dev01', 'topic_1', {
            "sensor": "dht",
            "temp": req.query.temp,
            "humi": req.query.humi
         });

    /*while (req.query.temp != null & req.query.humi != null & req.query.dust != null) {
*/

});

router.get('/setDust', (req, res) => {
    console.log('/sensor/set 요청:')
    console.log(req.query.devid)
    console.log(req.query.dust, "[ug/m3]")
    res.send('ok')

        publish('dev01', 'topic_1', {
            "sensor": "dust",
            "dust": req.query.dust
         });

    /*while (req.query.temp != null & req.query.humi != null & req.query.dust != null) {
*/

});


dev01.on('connect', function() {
    // 이 함수를 호출되었다는 것은 AWS IoT의 Thing과 연결되었다는 의미다.
    console.log('connect');

    // 연결되면 'topic_1'이라는 사서함을 구독하겠다고 선언한다.
    // => 즉 지금부터 연결된 Thing의 'topic_1'이라는 사서함에
    //    메시지가 오면 받겠다는 의미다.
    dev01.subscribe('topic_1');
    console.log('topic_1의 사서함 구독 시작')
});

// 구독하기로 설정한 사서함에 메시지가 도착할 때 마다
// AWS IoT 서버에 이 프로그램에 알려준다.
// 그때 호출될 메서드를 추가한다.
dev01.on('message', function(topic, payload) {
    console.log('사서함 메시지 도착');
    console.log('사서함 이름:', topic);
    console.log('받은 메시지:', payload.toString());
    console.log('-------------------------');
});

/*
var winston = require('winston'); // 로그 처리 모듈
var winstonDaily = require('winston-daily-rotate-file'); // 로그 일별 처리 모듈
var moment = require('moment'); // 시간 처리 모듈


function timeStampFormat() {
    return moment().format('yyyymmddhhmmss');
    // ex) '2016-05-01 20:14:28.500 +0900'
};

var logger = new (winston.Logger) ({
    transports: [
        new (winstonDaily) ({
            name: 'info-file',
            filename: './log/server',
            datePattern: '_yyyy-MM-dd.log',
            colorize: false,
            maxsize: 50000000,
            maxFiles: 1000,
            level: 'info',
            showLevel: true,

            json: false,
            timestamp: timeStampFormat
        }),
        new (winston.transports.Console) ({
            name: 'debug-console',
            colorize: true,
            level: 'debug',
            showLevel: true,
            json: false,
            timestamp:timeStampFormat
        })
    ],
    exceptionHandlers: [
        new (winstonDaily) ({
            name: 'exception-file',
            filename: './log/exception',
            datePattern: '_yyyy-MM-dd.log',
            colorize: false,
            maxsize: 50000000,
            maxFiles: 1000,
            level: 'error',
            showLevel: true,
            json: false,
            timestamp: timeStampFormat
        }),
        new (winston.transports.Console) ({
            name: 'exception-console',
            colorize: true,
            level: 'debug',
            showLevel: true,
            json: false,
            timestamp: timeStampFormat
        })
    ]

});

timeStampFormat() = logger
*/
function publish(deviceName, topic, dataObj) {
    devices[deviceName].publish(topic, JSON.stringify(dataObj));
};

module.exports = router;
