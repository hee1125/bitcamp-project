var obj = {};
obj['aaa'] = 10;
obj['bbb'] = 20;
obj['ccc'] = 30;

for (var propName in obj) {
  console.log(propName);
}


if (/aaa/ == /aab/) { // -1이 아니라면 true
console.log();
}
