
main(List<String> args) {
  
  print(Color.red.name);
  print(Color.nameToString());

  assert(Color.red.name == 'red');
}


//静态变量在第一次使用的时候才被初始化。
class Color {
  static const red = const Color('red');
  final String name;
  const Color(this.name);

  static String nameToString() {
    return 'color nameToString';
  }
}