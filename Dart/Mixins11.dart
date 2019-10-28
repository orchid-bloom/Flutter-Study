main(List<String> args) {
  
}


//Mixins 是一种在多类继承中重用 一个类代码的方法。
//使用 with 关键字后面为一个或者多个 mixin 名字来使用 mixin

abstract class Musical {
  bool canPlayPiano = false;
  bool canCompose = false;
  bool canConduct = false;

  void entertainMe() {
    if (canPlayPiano) {
      print('can Play Piano');
    } else if (canCompose) {
      print('Waving hands');
    } else {
      print('Humming to self');
    }
  }
}

class Performer {
  
}

class Musician extends Performer with Musical {
  
}

