main(List<String> args) {
  
  var test = GenericsTest();
  test.test();

  print(test is Cache);
}

abstract class Cache<T> {
  T getByKey(String key);
  setByKey(String key, T value);
}

class GenericsTest {
  var names = <String>['Tema','Saily','Tom'];
  var pages = <String, String> { 'index.html' : 'HomePage',
                                 'detail.html': 'detail' };
  
  test() {
    names.add('jason');

    var nameSet = new Set<String>.from(names);
    nameSet.forEach((f) => print(f));
  }
}




//当使用泛型类型的时候，你 可能想限制泛型的具体类型。 使用 extends 可以实现这个功能：
class GenericsClassHH <T extends Cache> {


/*
函数的返回值类型 (T).
参数的类型 (List<T>).
局部变量的类型 (T tmp).
 */
  T first<T> (List<T> ts) {
    T temp = ts[0];
    return  temp;
  }
}