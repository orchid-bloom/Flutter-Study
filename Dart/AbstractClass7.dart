
main(List<String> args) {
  

  var  doer1 = new EffectiveDoer();
  print(doer1);
}

//实例函数、 getter、和 setter 函数可以为抽象函数， 抽象函数是只定义函数接口但是没有实现的函数，由子类来 实现该函数。如果用分号来替代函数体则这个函数就是抽象函数。
//调用一个没实现的抽象函数会导致运行时异常。
abstract class Doer { 
  void doSomething();
}

class EffectiveDoer extends Doer {
  void doSomething() {

  }

  void updateChildren() {

  }
}