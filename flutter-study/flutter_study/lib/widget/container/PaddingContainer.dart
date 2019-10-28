import 'package:flutter/material.dart';

//Padding可以给其子节点添加补白（填充），我们在前面很多示例中都已经使用过它了，现在来看看它的定义：
//Padding({
//  ...
//  EdgeInsetsGeometry padding,
//  Widget child,
//})

/*
EdgeInsets
我们看看EdgeInsets提供的便捷方法：

fromLTRB(double left, double top, double right, double bottom)：分别指定四个方向的补白。
all(double value) : 所有方向均使用相同数值的补白。
only({left, top, right ,bottom })：可以设置具体某个方向的补白(可以同时指定多个方向)。
symmetric({ vertical, horizontal })：用于设置对称方向的补白，vertical指top和bottom，horizontal指left和right。
* */
class PaddingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Text("Hello world"),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text("I am Jack"),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20,50,20,20),
              child: Text("Your friend"),
            ),
          ],
        ),
    );
  }
}