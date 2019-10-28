

// 这是程序执行的入口。
main() {
  var number = 42; // 定义并初始化一个变量。
  printNumber(number); // 调用一个方法。
  printVariables();
  printFinalConst();
}

// 定义个方法。
printNumber(num aNumber) {
  print('The number is $aNumber.'); // 在控制台打印内容。
}

/*
1、所有能够使用变量引用的都是对象， 每个对象都是一个类的实例。在 Dart 中 甚至连 数字、方法和 null 都是对象。所有的对象都继承于 Object 类。
2、和 Java 不同的是，Dart 没有 public、 protected、 和 private 关键字。如果一个标识符以 (_) 开头，则该标识符 在库内是私有的。
*/

//Variables（变量）
printVariables() {
  var name = 'tema';
  int lineCount = 20;
  assert(lineCount == null);
  printNumber(lineCount);


  String userName = 'Tema Tian';
  print(userName);
}


//Final and const
/* 如果你以后不打算修改一个变量，使用 final 或者 const。 一个 final 变量只能赋值一次；一个 const 变量是编译时常量。 （Const 变量同时也是 final 变量。） 顶级的 final 变量或者类中的 final 变量在 第一次使用的时候初始化。
 实例变量可以为 final 但是不能是 const 。
*/
printFinalConst() {
  final city = 'Xi An';

  //const 变量为编译时常量。 如果 const 变量在类中，请定义为 static const。 可以直接定义 const 和其值，也 可以定义一个 const 变量使用其他 const 变量的值来初始化其值。
  const bar = 10000000000;
  const atm = bar * 1.0000035;

  //const 关键字不仅仅只用来定义常量。 有可以用来创建不变的值， 还能定义构造函数为 const 类型的，这种类型 的构造函数创建的对象是不可改变的。任何变量都可以有一个不变的值。
  var foo = const [];
  final barz = const [];
  const baz = const [];
  
  // You can change the value of a non-final, non-const variable,
   // even if it used to have a const value.
  foo = [];

   // You can't change the value of a final or const variable.
   // bar = []; // Unhandled exception.
   // baz = []; // Unhandled exception.


   //被final或者const修饰的变量，变量类型可以省略，建议指定数据类型。
   //可以省略String这个类型声明
   final name1 = "Bob";
   final String name2  = "张三";
 
   const name3 = "alex";
   const String name4 = "李四";

   const String name6666 = "***********";
   print(name6666);

   //flnal 或者 const 不能和 var 同时使用
   //常量如果是类级别的，请使用 static const
   //在常量表达式中，该运算符的操作数必须为'bool'、'num'、'String'或'null', const常量必须用conat类型的值初始化。
   const String outSideName = 'Bill';
   final String outFianlName = 'Alex';
   const String outName = 'Tom';
   const aConstList = const['1','2','3'];
  //  const validConstString = '$outSideName $outFianlName $outName'; //error
    const validConstString = '$outSideName Alex $outName'; //error
   print(validConstString);
}
