var parseString = require('xml2js').parseString;

var xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><NewAddressListResponse><cmmMsgHeader><requestMsgId></requestMsgId><responseMsgId></responseMsgId><responseTime>20171122:200850878</responseTime><successYN>Y</successYN><returnCode>00</returnCode><errMsg></errMsg><totalCount>1</totalCount><countPerPage>10</countPerPage><totalPage>1</totalPage><currentPage>1</currentPage></cmmMsgHeader><newAddressListAreaCd><zipNo>05509</zipNo><lnmAdres>서울특별시 송파구 올림픽로33길 17 (신천동, 미성아파트)</lnmAdres><rnAdres>서울특별시 송파구 신천동 17-6 미성아파트</rnAdres></newAddressListAreaCd></NewAddressListResponse>'

parseString(xml, (err, result) => {
    var headers = result.NewAddressListResponse.cmmMsgHeader[0];
    var totalCount = headers.totalCount[0];
    var countPerPage = headers.countPerPage[0];
    var currentPage = headers.currentPage[0];

    console.log(totalCount);
    console.log(countPerPage);
    console.log(currentPage);
    console.log('------------------------------');

    var addrList = result.NewAddressListResponse.newAddressListAreaCd;
    for (var addr of addrList) {
        console.log(addr.zipNo[0]);
        console.log(addr.rnAdres[0]);
        console.log(addr.lnmAdres[0]);
        console.log('-------------------------')
    }
      
});
