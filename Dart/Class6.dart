import 'dart:math';

main(List<String> args) {
  
  var p1 = new Point(1,2);
  print( 'p1:x = ' + p1.x.toString());
  print( 'p1:y = ' + p1.y.toString());

  print(p1.runtimeType == Point);

  var json = new Map.from({'x':3,'y':4});
  // var p2 = new Point.fromJson(json);
  // print( 'p2:x = ' + p2.x.toString());
  // print( 'p2:y = ' + p2.y.toString());

  var p3 = new Point(3,3);

  var emp = new Employee.fromJson(json);
  if (emp is Person) {  //is 类型判断  as 类型转换
    emp.firstName = 'Bob';
  }
  print(emp.firstName);
  (emp as Person).firstName = 'Tom';
  print(emp.firstName);








  var imPoint = ImmutablePoint.origin;
  print('${imPoint.x} ${imPoint.y}');








  var logger = new Logger('UI');
  logger.log("我是调试信息");








  var rect = new Rectangle(3, 4, 20, 15);
  assert(rect.left == 3);
  rect.right = 12;
  assert(rect.left == -8);
}

//Dart 是一个面向对象编程语言，同时支持基于 mixin 的继承机制。 每个对象都是一个类的实例，所有的类都继承于 Object.。 基于 Mixin 的继承 意味着每个类（Object 除外） 都只有一个超类，一个类的代码可以在其他 多个类继承中重复使用。
//使用 new 关键字和构造函数来创建新的对象。 构造函数名字可以为 ClassName 或者 ClassName.identifier
//使用 ?. 来替代 . 可以避免当左边对象为 null 时候 抛出异常：
//可以使用 Object 的 runtimeType 属性来判断实例 的类型，该属性 返回一个 Type 对象。

class Point {
  final num x;
  final num y;
  final num distanceFromOrigin;
  //定义一个和类名字一样的方法就定义了一个构造函数 还可以带有其他可选的标识符，详情参考 Named constructors)（命名构造函数）。 常见的构造函数生成一个 对象的新实例：
  //只有当名字冲突的时候才使用 this。否则的话， Dart 代码风格样式推荐忽略 this。
  // Point(num x, num y) {
  //   this.x = x;
  //   this.y = y;
  // }



  //由于把构造函数参数赋值给实例变量的场景太常见了， Dart 提供了一个语法糖来简化这个操作：
  // Point(this.x, this.y);


   //Named constructors（命名构造函数）
   //使用命名构造函数可以为一个类实现多个构造函数， 或者使用命名构造函数来更清晰的表明你的意图：
   //构造函数不能继承，所以超类的命名构造函数 也不会被继承。如果你希望 子类也有超类一样的命名构造函数， 你必须在子类中自己实现该构造函数。
  // Point.fromJson(Map json) {
  //   x = json['x'];
  //   y = json['y'];
  // }




  //初始化列表
  //在构造函数体执行之前除了可以调用超类构造函数之外，还可以 初始化实例参数。 使用逗号分隔初始化表达式。
  // Point.fromJson(Map json) : x = json['x'],y = json['y'] {
  //       print('初始化实例参数 In Point.fromJson(): ($x, $y)');
  // }


  //初始化列表非常适合用来设置 final 变量的值
  Point(x,y) :x = x,y = y,distanceFromOrigin = sqrt(x*x + y*y) {
    print('$x * $x + $y * $y 开方： $distanceFromOrigin');
  }

  //Redirecting constructors（重定向构造函数）
  Point.alongXAxis(num x) : this(x,0);
}










  /*
  默认情况下，子类的构造函数会自动调用超类的 无名无参数的默认构造函数。 超类的构造函数在子类构造函数体开始执行的位置调用。 如果提供了一个 initializer list（初始化参数列表） ，则初始化参数列表在超类构造函数执行之前执行。 下面是构造函数执行顺序：
  initializer list（初始化参数列表）
  superclass’s no-arg constructor（超类的无名构造函数）
  main class’s no-arg constructor（主类的无名构造函数）
  如果超类没有无名无参数构造函数， 则你需要手工的调用超类的其他构造函数。 在构造函数参数后使用冒号 (:) 可以调用 超类构造函数
  */

  class Person {
    String firstName;
    Person.fromJson(Map json) {
      print('in Persion');
    }
  }

  class Employee extends Person {
    // Employee.fromJson(Map json) : super.fromJson(json) {
    //   print('in Employee');
    // }

    Employee.fromJson(Map json) : super.fromJson(_findDefaultData()) {
      print('in Employee');
    }
  }

  //由于超类构造函数的参数在构造函数执行之前执行，所以 参数可以是一个表达式或者 一个方法调用：
Map _findDefaultData() => {'':''};









//常量构造函数
//如果你的类提供一个状态不变的对象，你可以把这些对象 定义为编译时常量。要实现这个功能，需要定义一个 const 构造函数， 并且声明所有类的变量为 final。
class ImmutablePoint {
  final num x;
  final num y;
  const ImmutablePoint(this.x,this.y);
  static final ImmutablePoint origin = const ImmutablePoint(7,9);
}







//Factory constructors（工厂方法构造函数）
//如果一个构造函数并不总是返回一个新的对象，则使用 factory 来定义 这个构造函数。例如，一个工厂构造函数 可能从缓存中获取一个实例并返回，或者 返回一个子类型的实例。
class Logger {
  final String name;
  bool mute = false;
  static final Map<String, Logger> _cache = <String, Logger>{};

  //工厂构造函数无法访问 this。
  factory Logger(String name) {
    if (_cache.containsKey(name)) {
       return _cache[name];
    } else {
      final logger = new Logger._internal(name);
      _cache[name] = logger;
      return logger;
    }
  }

  Logger._internal(this.name);

  void log(String msg) {
    print(msg);
  }
}


//Methods（函数）

//Instance methods（实例函数）,对象的实例函数可以访问 this。 


//Getters and setters


//Getters 和 setters 是用来设置和访问对象属性的特殊 函数。每个实例变量都隐含的具有一个 getter， 
//如果变量不是 final 的则还有一个 setter。 你可以通过实行 getter 和 setter 来创建新的属性， 使用 get 和 set 关键字定义 getter 和 setter：
class Rectangle {
  num left;
  num top;
  num width;
  num height;

  Rectangle(this.left, this.top, this.width, this.height);

  // Define two calculated properties: right and bottom.
  num get right             => left + width;
      set right(num value)  => left = value - width;
  num get bottom            => top + height;
      set bottom(num value) => top = value - height;
}