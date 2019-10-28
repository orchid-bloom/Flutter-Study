//每个应用程序都必须有一个顶层main()函数，它可以作为应用程序的入口点。该main()函数返回void并具有List<String>参数的可选参数。
main(List<String> args) {
  _say();
  _go();

  // say1(from: "s", msg: "g");
  _enableFlags(bold: true);
}
//Dart 是一个真正的面向对象语言，方法也是对象并且具有一种 类型， Function。 这意味着，方法可以赋值给变量，也可以当做其他方法的参数。 也可以把 Dart 类的实例当做方法来调用。

//可选参数可以是命名参数或者基于位置的参数，但是这两种参数不能同时当做可选参数。
// String say2({String from, String msg, [String s]}) {
//   var result = '$from says $msg';
//   return result;
// }

//Optional named parameters（可选命名参数） 在定义方法的时候，使用 {param1, param2, …} 的形式来指定命名参数：
String say1({String from, String msg}) {
  var result = '$from says $msg';
  return result;
}


//把一些方法的参数放到 [] 中就变成可选 位置参数了：
String say(String from, String msg, [String device]) {
  var result = '$from says $msg';
  if (device != null) {
    result = '$result with a $device';
  }
  return result;
}

 void _enableFlags({bool bold = false, bool hidden = false}) {

}


//可以把方法当做参数调用另外一个方法。例如：
printElement(element) {
  print(element);
}

_say() {
 var list = [1,2,3];
  list.forEach(printElement);
}



//Anonymous functions（匿名方法）
_go() {
  var list = ['apples', 'oranges', 'grapes', 'bananas', 'plums'];
  list.forEach((i){
    print(list.indexOf(i).toString() + ':' + i);
  });

  list.forEach((i)=>
    print(list.indexOf(i).toString() + ':' + i)
  );
}
