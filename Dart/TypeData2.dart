main(List<String> args) {
   _numTest();
   _stringTest();
   _boolSTest();
   _listTest();
   _mapTest();
}

//num 是数字类型的父类，有两个子类 int 和 double。
/*
int   根据平台的不同，整数值不大于64位。在Dart VM上，值可以从-263到263 - 1，编译成JavaScript的Dart使用JavaScript代码，允许值从-253到253 - 1。
double 64位（双精度）浮点数，如IEEE 754标准所规定。
 */
_numTest() {
  int a = 1;
  print(a);

  double b = 1.0;
  print(b + 2);


  // String to double
  var oneDoubleNum = double.parse('1.248765');
  print(oneDoubleNum);

  //int to String
  String oneStr = 1024.toString();
  print(oneStr);

  //double to String ,注意括号中要有小数点位数，否则报错
  String piToString = 3.1415926.toStringAsFixed(2);
  // // 截取两位小数, 输出3.14
  print(piToString);

  String aString = 1.12678.toStringAsFixed(2);
   // 检查是否四舍五入，输出1.13，发现会做四舍五入
     print(aString);
}




//Dart 字符串是 UTF-16 编码的字符序列。 可以使用单引号或者双引号来创建字符串：用${} 来计算字符串中变量的值，需要注意的是如果是表达式需要${表达式}
_stringTest() {
  var s1 = 'Single quotes work well for string literals.';
  var s2 = "Double quotes work just as well.";
  var s3 = 'It\'s easy to escape the string delimiter.';
  var s4 = "It's even easier to use the other delimiter.";
  /*
  == 操作符判断两个对象的内容是否一样。 如果两个字符串包含一样的字符编码序列， 则他们是相等的。
  单引号或者双引号里面嵌套使用引号
   */
  print('$s1 \n $s2 \n $s3 \n $s4');
  print('$s4 "草书" $s2');
  print('$s4 "草书" ${12345.toString()}');

  //可以使用 + 操作符来把多个字符串链接为一个，也可以把多个 字符串放到一起来实现同样的功能：
  print(s1 + " + " + s2);

  //使用三个单引号或者双引号也可以 创建多行字符串对象：
  var s5 = """
   哈哈哈
   ❓
   什么东东
   多行文本
   """;
  print(s5);

  var s = r"In a raw string, even \n isn't special.";  //\n 会输出
  print(s);
}




//bool
//当 Dart 需要一个布尔值的时候，只有 true 对象才被认为是 true。 所有其他的值都是 flase。这点和 JavaScript 不一样， 像 1、 "aString"、 以及 someObject 等值都被认为是 false。
_boolSTest() {
  
}




//List集合
_listTest() {
  List list = [1,2,3];
  print(list);


   // 使用List的构造函数，也可以添加int参数，表示List固定长度，不能进行添加 删除操作
   var fruits = new List();
   fruits.add(1);
   fruits.add("ss");
   print(fruits);

   var subFruits = ['apple','oranges'];
    fruits.addAll(subFruits);
    print(fruits);
    print(fruits.length);
    print(fruits.first);
    print(fruits.last);
    print(fruits.indexOf('apple'));
    print(fruits[0]);
    fruits.removeLast();
    fruits.insert(0, '😆');
    // 删除指定条件的元素(这里是元素长度大于6)
    fruits.removeWhere((item) => item == 'ss');
    // 保留指定条件的元素(这里是元素长度大于6)
    fruits.retainWhere((item) => item == '😆');
    // 删除所有的元素
    fruits.clear();
}






_mapTest() {
 //初始化Map方式一： 直接声明，用{}表示，里面写key和value，每组键值对中间用逗号隔开。
   Map companys = {'key1':'name','key2':'name','key3':'name','key4':'name','key5':'name','key6':'name','key7':'name','key8':'name','key9':'name'};
   print(companys);
 //创建Map方式二：先声明，再去赋值。
 Map shools = new Map();
 shools['key1'] = '1';
 shools['key2'] = '2';
 shools['key3'] = '3';
 shools['key4'] = '4';
 shools['key5'] = '5';
 shools['key6'] = '6';
 print(shools);

 var shools2 = new Map();
  shools2['key1'] = '1';
  shools2['key2'] = '2';
  shools2['key3'] = '3';
  shools2['key4'] = '4';
  shools2['key5'] = '5';
  shools2['key6'] = '6';
  print(shools2);


  // 指定键值对的参数类型
  var aMap = new Map<int, String>();
  // Map的赋值，中括号中是Key，这里可不是数组
  aMap[1] = '小米';

//Map中的键值对是唯一的
//同Set不同，第二次输入的Key如果存在，Value会覆盖之前的数据
  aMap[1] = 'alibaba';

// map里面的value可以相同
  aMap[2] = 'alibaba';

// map里面value可以为空字符串
  aMap[3] = '';

// map里面的value可以为null
  aMap[4] = null;  
  print(aMap);

  print(aMap.containsKey(1));

  aMap.remove(1);
  print(aMap);


  /*
  map的key类型不一致也不会报错。 
  添加元素的时候，会按照你添加元素的顺序逐个加入到map里面，哪怕你的key，比如分别是 1,2,4，看起来有间隔，事实上添加到map的时候是{1:value,2:value,4:value} 这种形式。
  map里面的key不能相同。但是value可以相同,value可以为空字符串或者为null。
  */
}








//运算符
/*
描述
操作符


一元后置操作符

expr++  expr--  ()  []  .   ?.



一元前置操作符

expr !expr ~expr ++expr --expr



乘除

*  / %  ~/



加减
+ -


位移

<<  >>



按位与
&


按位或




按位异或
^


逻辑与
&&


逻辑或





关系和类型判断

>=  >  <=  <  as  is  is!



等

==  !=



如果为空
??


条件表达式
expr1 ? expr2 : expr3


赋值

= *= /= ~/= %= += -= <<= >>= &= ^= = ??=


级联
..

*/