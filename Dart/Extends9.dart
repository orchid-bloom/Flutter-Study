main(List<String> args) {
  
}

class Television {
  void turnOn() {
   print('turnOn'); 
  }
}

// @proxy 注解来避免警告信息：
class SmartTelevision extends Television {

  //@override 注解来 表明你的函数是想覆写超类的一个函数：
  @override
  void turnOn() {
    // TODO: implement turnOn
    super.turnOn();
  }
}