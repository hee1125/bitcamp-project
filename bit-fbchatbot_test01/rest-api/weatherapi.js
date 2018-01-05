// const request = require('request');
// const parseString = require('xml2js').parseString;
//
//
// const searchWeather = (type, searchWord, callback) => {
//     var uri = 'http://apis.skplanetx.com/weather/current/hourly';
//     /* Service Key*/
//     var queryString = '?appKey=' + process.env.WEATHERAPI_KEY;
//
//     /*API version*/
//     queryString += '?version=1'
//
//     /*검색조건 1. 위도 검색 lat 경도 검색 lon*/
//     queryString += '&lat=' + ;
//     queryString += '&lon=' + ;
//
//     /*검색조건 2. 시 city 구 county 동 village */
//     queryString += '&city=' + ;
//     queryString += '&county=' + ;
//     queryString += '&village=' +;
//
//     request({
//         uri: uri + queryString,
//     }, function (error, response, body) {
//         //console.log('=> Status', response.statusCode);
//         //console.log('=> Headers', JSON.stringify(response.headers));
//         console.log('=> Reponse received', body);
//         parseString(body,(err, result) => {
//             var headers = result.NewAddressListResponse.cmmMsgHeader[0];
//             var totalCount = headers.totalCount[0];
//             var countPerPage = headers.countPerPage[0];
//             var currentPage = headers.currentPage[0];
//             console.log('[주소 검색 결과]');
//             console.log(totalCount);
//             console.log(countPerPage);
//             console.log(currentPage);
//             console.log("-----------------------");
//
//
//             var message = '';
//             var addrList = result.NewAddressListResponse.newAddressListAreaCd;
//
//             for(var addr of addrList){
//               message += '[' + addr.zipNo[0] + ']\n';
//               message +=  addr.rnAdres[0] +'\n';
//               message +=  addr.lnmAdres[0] +'\n';
//               message += '\n';
//
//             }
//             callback(message)
//
//         });
//     });
// };
//
// module.exports = {
//     searchNewAddress
// };


//
