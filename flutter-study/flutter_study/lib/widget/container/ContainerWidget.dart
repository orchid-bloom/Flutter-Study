import 'package:flutter/material.dart';

//Container是我们要介绍的最后一个容器类widget，它本身不对应具体的RenderObject，它是DecoratedBox、ConstrainedBox、Transform、Padding、Align等widget的一个组合widget。所以我们只需通过一个Container可以实现同时需要装饰、变换、限制的场景。下面是Container的定义：
/*
Container({
  this.alignment,
  this.padding, //容器内补白，属于decoration的装饰范围
  Color color, // 背景色
  Decoration decoration, // 背景装饰
  Decoration foregroundDecoration, //前景装饰
  double width,//容器的宽度
  double height, //容器的高度
  BoxConstraints constraints, //容器大小的限制条件
  this.margin,//容器外补白，不属于decoration的装饰范围
  this.transform, //变换
  this.child,
})

容器的大小可以通过width、height属性来指定，也可以通过constraints来指定，如果同时存在时，width、height优先。实际上Container内部会根据width、height来生成一个constraints。
color和decoration是互斥的，实际上，当指定color时，Container内会自动创建一个decoration。
* */

class ContainerContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 100,top: 100,right: 0, bottom: 400),
      constraints: BoxConstraints(minWidth: 200,minHeight: 200),
      decoration: BoxDecoration(
        gradient: RadialGradient(colors: [Colors.red, Colors.orange],
        center: Alignment.topLeft,
        radius: 0.98),
        boxShadow: [
          BoxShadow(
              color: Colors.black54,
              offset: Offset(2, 2),
              blurRadius: 6
        )]
      ),
      transform: Matrix4.rotationZ(.2),
      alignment: Alignment.center,
      child: Text("5.20", style:  TextStyle(color: Colors.white, fontSize: 40.0),),
    );
  }
}