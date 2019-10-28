main(List<String> args) {

  Color.values.forEach( (color) => print(color.index));
}

//枚举类型通常称之为 enumerations 或者 enums， 是一种特殊的类，用来表现一个固定 数目的常量。
enum Color {
  red,
  green,
  blue,
}