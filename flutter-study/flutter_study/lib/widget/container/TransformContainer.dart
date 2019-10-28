import 'package:flutter/material.dart';
import 'dart:math' as math;

//Transform可以在其子Widget绘制时对其应用一个矩阵变换（transformation），Matrix4是一个4D矩阵，通过它我们可以实现各种矩阵操作。下面是一个例子：
class TransformContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    //翻转
//    return Container(
//      padding: const EdgeInsets.only(left: 15,top: 60),
//      color: Colors.black,
//      child: new Transform(
//        alignment: Alignment.topRight, ////相对于坐标系原点的对齐方式
//        transform: new Matrix4.skewY(0.3),
//        child: new Container(
//          padding: const EdgeInsets.all(8),
//          color: Colors.deepOrange,
//          child: const Text("Apartment for rent!"),
//        ),
//      ),
//    );

     //平移
//     return DecoratedBox(
//        decoration: BoxDecoration(color: Colors.red),
//        child: Transform.translate(
//             offset: Offset(-10, 40),
//             child: Text("Hello world"),
//           )
//     );

     //缩放
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 60),
//       child: DecoratedBox(
//           decoration: BoxDecoration(color: Colors.red),
//           child: Transform.scale(
//             scale: 1.5,
//             child: Text("Hello world"),
//           )
//       ),
//     );

     //旋转
     return Padding(
       padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 60),
       child: DecoratedBox(
           decoration: BoxDecoration(color: Colors.red),
           child: Transform.rotate(
               angle: math.pi / 2,
               child: Text("Hello world"),
           ),
       ),
     );

     //note
     //Transform的变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子widget应用何种变化，其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的。下面我们具体说明：
//    return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 60),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           DecoratedBox(
//               decoration:BoxDecoration(color: Colors.red),
//               child: Transform.scale(scale: 1.5,
//                   child: Text("Hello world")
//               )
//           ),
//           Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
//         ],
//       ),
//     );








    //RotatedBox
    //RotatedBox和Transform.rotate功能相似，它们都可以对子widget进行旋转变换，但是有一点不同：RotatedBox的变换是在layout阶段，会影响在子widget的位置和大小。我们将上面介绍Transform.rotate时的示例改一下：
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 60),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          DecoratedBox(
              decoration:BoxDecoration(color: Colors.red),
              child: RotatedBox(
                quarterTurns: 1,
                child: Text("Hello world"),
              )
          ),
          Text("你好", style: TextStyle(color: Colors.green, fontSize: 18.0),)
        ],
      ),
    );
  }
}