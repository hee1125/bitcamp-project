var parseString = require('xml2js').parseString;

var xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><NewAddressListResponse><cmmMsgHeader><requestMsgId></requestMsgId><responseMsgId></responseMsgId><responseTime>20171122:200706258</responseTime><successYN>Y</successYN><returnCode>00</returnCode><errMsg></errMsg><totalCount>226</totalCount><countPerPage>10</countPerPage><totalPage>23</totalPage><currentPage>1</currentPage></cmmMsgHeader><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 남왕길 7 (조남동)</lnmAdres><rnAdres>경기도 시흥시 조남동 179-4</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 남왕길 11 (조남동)</lnmAdres><rnAdres>경기도 시흥시 조남동 180-10</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 동서로 1039-2 (조남동, 조남동다세대주택)</lnmAdres><rnAdres>경기 도 시흥시 조남동 176-8 조남동다세대주택</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 동서로 1039-4 (조남동, 조남동다세대주택)</lnmAdres><rnAdres>경기도 시흥시 조남동 176-7 조남동다세대주택</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 동서로 1039-6 (조남동, 조남동다세대주택)</lnmAdres><rnAdres>경기도 시흥시 조남동 176-8 조남동다세대주택</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 동서로 1039-8 (조남동, 조남동다세대주택)</lnmAdres><rnAdres>경기도 시흥시 조남동 176-7 조남동다세대주택</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시  동서로 1039-10 (조남동, 대명쉐르빌)</lnmAdres><rnAdres>경기도 시흥시 조남동 176-6 대명쉐르빌</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 동서로 1039-12 (조남동, 대명쉐르빌)</lnmAdres><rnAdres>경기도 시흥시 조남동 176-5 대명쉐르빌</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 동서로 1039-14 (조남동, 대명쉐르빌)</lnmAdres><rnAdres>경기도 시 흥시 조남동 176-4 대명쉐르빌</rnAdres></newAddressListAreaCd><newAddressListAreaCd><zipNo>14984</zipNo><lnmAdres>경기도 시흥시 동서로 1039-16 (조남동, 대명쉐르빌)</lnmAdres><rnAdres>경기도 시흥시 조남동 176-3 대명쉐르빌</rnAdres></newAddressListAreaCd></NewAddressListResponse>'


parseString(xml,(err, result) => {
    var headers = result.NewAddressListResponse.cmmMsgHeader[0];
    var totalCount = headers.totalCount[0];
    var countPerPage = headers.countPerPage[0];
    var currentPage = headers.currentPage[0];

    console.log(totalCount);
    console.log(countPerPage);
    console.log(currentPage);
    console.log("-----------------------");

    var addrList = result.NewAddressListResponse.newAddressListAreaCd;


    for(var addr of addrList){
      console.log(addr.zipNo[0]);
      console.log(addr.rnAdres[0]);
      console.log(addr.lnmAdres[0]);
      console.log("-----------------------");
    }

});
