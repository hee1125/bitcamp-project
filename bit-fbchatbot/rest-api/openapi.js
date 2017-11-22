const request = require('request');
var parseString = require('xml2js').parseString;


const searchNewAddress = (type, searchWord, callback) => {
    var uri = 'http://openapi.epost.go.kr/postal/retrieveNewAdressAreaCdService/retrieveNewAdressAreaCdService/getNewAddressListAreaCd';

    /* Service Key*/
    var queryString = '?ServiceKey=' + process.env.OPENAPI_KEY;

    /* dong : 동(읍/면)명 road :도로명[default] post : 우편번호 */
    queryString += '&searchSed=' + type;

    /* 검색어 */
    queryString += '&srchwrd=' + encodeURIComponent(searchWord);

    /* 페이지당 출력될 개수를 지정 */
    queryString += '&countPerPage=10';

    /* 출력될 페이지 번호 */
    queryString += '&currentPage=1';
  request({
    uri: uri + queryString
    //uri: 'http://openapi.epost.go.kr/postal/retrieveNewAdressAreaCdService/retrieveNewAdressAreaCdService/getNewAddressListAreaCd',
    //qs: {
          /* Service Key*/
    //      'ServiceKey' : '88i10DuxPHVkWtgO54BBDR3wzp7T0axT8GPdlN72s9ooJgRxT6TGjtwpUF5hRCb9F4wwuJd5xrDF8%2FvY8Ryr7Q%3D%3D',
    //      'searchSe' : 'dong', /* dong : 동(읍/면)명 road :도로명[default] post : 우편번호 */
    //      'srchwrd' : encodeURIComponent(searchword), /* 검색어 */
    //      'countPerPage' : 10, /* 페이지당 출력될 개수를 지정 */
    //      'currentPage' : 1 /* 출력될 페이지 번호 */
    //    },
    //method: 'GET'

  }, function (error, response, body) {
      //console.log('=> Status', response.statusCode);
      //console.log('=> Headers', JSON.stringify(response.headers));
      console.log('=> Reponse received', body);
      parseString(body, (err, result) => {
          var headers = result.NewAddressListResponse.cmmMsgHeader[0];
          var totalCount = headers.totalCount[0];
          var countPerPage = headers.countPerPage[0];
          var currentPage = headers.currentPage[0];

          console.log('[주소 검색 결과]');
          console.log(totalCount);
          console.log(countPerPage);
          console.log(currentPage);
          console.log('------------------------------');

          var message = '';



          var addrList = result.NewAddressListResponse.newAddressListAreaCd;
          for (var addr of addrList) {
              message += '['+ addr.zipNo[0] +']' \n
              message += '['+ addr.rnAdres[0] +']' \n
              message += '['+ addr.addr.lnmAdres[0] +']' \n
              message += '\n';
          }

          callback(message);


      });
  });
}



module.exports = {
    searchNewAddress
};
