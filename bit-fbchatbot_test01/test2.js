var parseString = require('xml2js').parseString;

var value = {
    "weather":{
        "hourly":[
            {
                "grid":{
                    "longitude":"126.98936",
                    "latitude":"37.57988",
                    "city":"서울",
                    "county":"종로구",
                    "village":"원서동"
                },
                "wind":{
                    "wdir":"301.00",
                    "wspd":"5.10"
                },
                "precipitation":{
                    "sinceOntime":"0.00",
                    "type":"0"
                },
                "sky":{
                    "code":"SKY_O03",
                    "name":"구름많음"
                },
                "temperature":{
                    "tc":"4.20",
                    "tmax":"5.00",
                    "tmin":"-3.00"
                },
                "humidity":"35.00",
                "lightning":"0",
                "timeRelease":"2017-11-23 15:00:00"
            },
            {
              'xxxx' :'xxxx'

            }
        ]
    },
    "common":{
        "alertYn":"Y",
        "stormYn":"N"
    },
    "result":{
        "code":9200,
        "requestUrl":"/weather/current/hourly?lon=126.9658000000&village=도곡&county=강남구&lat=37.5714000000&version=1&city=서울",
        "message":"성공"
    }
}

console.log(value.weather.hourly[0].startsWith);
