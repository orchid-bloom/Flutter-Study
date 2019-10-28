import 'package:flutter/material.dart';

/*
Wrap({
  ...
  this.direction = Axis.horizontal,
  this.alignment = WrapAlignment.start,
  this.spacing = 0.0,
  this.runAlignment = WrapAlignment.start,
  this.runSpacing = 0.0,
  this.crossAxisAlignment = WrapCrossAlignment.start,
  this.textDirection,
  this.verticalDirection = VerticalDirection.down,
  List<Widget> children = const <Widget>[],
})


spacing：主轴方向子widget的间距
runSpacing：纵轴方向的间距
runAlignment：纵轴方向的对齐方式
*/
class WarpFlowLayout extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
//    return Wrap(
//      direction: Axis.horizontal,
//      spacing: 8.0,
//      runSpacing: 4.0,
//      alignment: WrapAlignment.start,
//      children: <Widget>[
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.red,
//            child: Text("A"),),
//          label: Text("Hamilton"),
//        ),
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.red,
//            child: Text("B"),),
//          label: Text("Lafayette"),
//        ),
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.red,
//            child: Text("C"),),
//          label: Text("Mulligan"),
//        ),
//        Chip(
//          avatar: CircleAvatar(
//            backgroundColor: Colors.red,
//            child: Text("D"),),
//          label: Text("Laurens"),
//        ),
//      ],
//    );


    /*
  我们一般很少会使用Flow，因为其过于复杂，需要自己实现子widget的位置转换，在很多场景下首先要考虑的是Wrap是否满足需求。Flow主要用于一些需要自定义布局策略或性能要求较高(如动画中)的场景。Flow有如下优点：

性能好；Flow是一个对child尺寸以及位置调整非常高效的控件，Flow用转换矩阵（transformation matrices）在对child进行位置调整的时候进行了优化：在Flow定位过后，如果child的尺寸或者位置发生了变化，在FlowDelegate中的paintChildren()方法中调用context.paintChild 进行重绘，而context.paintChild在重绘时使用了转换矩阵（transformation matrices），并没有实际调整Widget位置。
灵活；由于我们需要自己实现FlowDelegate的paintChildren()方法，所以我们需要自己计算每一个widget的位置，因此，可以自定义布局策略。
缺点：

使用复杂.
不能自适应子widget大小，必须通过指定父容器大小或实现TestFlowDelegate的getSize返回固定大小。
  * */
    return Flow(delegate: TestFlowDelegate(
      margin: EdgeInsets.all(20.0),
    ),
      children: <Widget>[
        new Container(width: 80.0, height:80.0, color: Colors.red,),
        new Container(width: 80.0, height:80.0, color: Colors.green,),
        new Container(width: 80.0, height:80.0, color: Colors.blue,),
        new Container(width: 80.0, height:80.0,  color: Colors.yellow,),
        new Container(width: 80.0, height:80.0, color: Colors.brown,),
        new Container(width: 80.0, height:80.0,  color: Colors.purple,),
      ],
    );
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(
                x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints){
    //指定Flow的大小
    return Size(double.infinity,500.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}