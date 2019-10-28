import 'package:flutter/material.dart';


//Flex可以沿着水平或垂直方向排列子widget，如果你知道主轴方向，使用Row或Column会方便一些，因为Row和Column都继承自Flex，参数基本相同，所以能使用Flex的地方一定可以使用Row或Column。

// Flex({
//  ...
//  @required this.direction, //弹性布局的方向, Row默认为水平方向，Column默认为垂直方向
//  List<Widget> children = const <Widget>[],
//})

// Expanded 可以按比例“扩伸”Row、Column和Flex子widget所占用的空间。
//const Expanded({
//  int flex = 1,
//  @required Widget child,
//})
//flex为弹性系数，如果为0或null，则child是没有弹性的，即不会被扩伸占用的空间。如果大于0，所有的Expanded按照其flex的比例来分割主轴的全部空闲空间。下面我们看一个例子：

class FlexboxLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return Column(
      children: <Widget>[
        Flex(direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(height: 30, color: Colors.red,),
            ),
            Expanded(
                flex: 2,
                child: Container(
                    height: 30.0,
                    color: Colors.green)
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 20.0),
          child: SizedBox(
            height: 100.0,
            child: Flex(
              direction: Axis.vertical,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.blueGrey,
                  ),
                ),
                Spacer(
                  flex: 1,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color:
                    Colors.yellow,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}