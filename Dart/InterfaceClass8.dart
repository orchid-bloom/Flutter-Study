main(List<String> args) {
   print(greetBob(new Person('kathy'))); 
   print(greetBob(new Imposter())); 
}

class Person {
  final _name;

  Person(this._name);

  String greet(who) => 'Hello, $who. I am $_name';
}


//Implicit interfaces（隐式接口）
//每个类都隐式的定义了一个包含所有实例成员的接口， 并且这个类实现了这个接口。如果你想 创建类 A 来支持 类 B 的 api，而不想继承 B 的实现， 则类 A 应该实现 B 的接口。
//一个类可以通过 implements 关键字来实现一个或者多个接口， 并实现每个接口定义的 API。
class Imposter implements Person {
  final _name = '';
  String greet(who) => 'Hi $who, Do you know who I am?';
}

greetBob(Person person) => person.greet('Bob');