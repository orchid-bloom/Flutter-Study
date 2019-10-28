import 'package:flutter/material.dart';

//Flutter提供了多种可滚动widget（Scrollable Widget）用于显示列表和长布局。在本章中，我们先介绍一下常用的可滚动widget（如ListView、GridView等），然后介绍一下Scrollable与可滚动widget的原理。可滚动Widget都直接或间接包含一个Scrollable widget，因此它们包括一些共同的属性，为了避免重复介绍，
//Scrollable({
//  ...
//  this.axisDirection = AxisDirection.down,
//  this.controller,
//  this.physics,
//  @required this.viewportBuilder, //后面介绍
//})


/*
axisDirection：滚动方向。
physics：此属性接受一个ScrollPhysics对象，它决定可滚动Widget如何响应用户操作，比如用户滑动完抬起手指后，继续执行动画；或者滑动到边界时，如何显示。默认情况下，Flutter会根据具体平台分别使用不同的ScrollPhysics对象，应用不同的显示效果，如当滑动到边界时，继续拖动的话，在iOS上会出现弹性效果，而在Android上会出现微光效果。如果你想在所有平台下使用同一种效果，可以显式指定，Flutter SDK中包含了两个ScrollPhysics的子类可以直接使用：
ClampingScrollPhysics：Android下微光效果。
BouncingScrollPhysics：iOS下弹性效果。
controller：此属性接受一个ScrollController对象。ScrollController的主要作用是控制滚动位置和监听滚动事件。默认情况下，widget树中会有一个默认的PrimaryScrollController，如果子树中的可滚动widget没有显式的指定controller并且primary属性值为true时（默认就为true），可滚动widget会使用这个默认的PrimaryScrollController，这种机制带来的好处是父widget可以控制子树中可滚动widget的滚动，例如，Scaffold使用这种机制在iOS中实现了"回到顶部"的手势。我们将在本章后面“滚动控制”一节详细介绍ScrollController。
* */



//Scrollbar是一个Material风格的滚动指示器（滚动条），如果要给可滚动widget添加滚动条，只需将Scrollbar作为可滚动widget的父widget即可
/*
Scrollbar(
  child: SingleChildScrollView(
    ...
  ),
);
* */

//CupertinoScrollbar是iOS风格的滚动条，如果你使用的是Scrollbar，那么在iOS平台它会自动切换为CupertinoScrollbar。
/*
SingleChildScrollView({
  this.scrollDirection = Axis.vertical, //滚动方向，默认是垂直方向
  this.reverse = false,
  this.padding,
  bool primary,
  this.physics,
  this.controller,
  this.child,
})
* */


// SingleChildScrollView类似于Android中的ScrollView，它只能接收一个子Widget。定义如下：
/*
reverse：该属性API文档解释是：是否按照阅读方向相反的方向滑动，如：scrollDirection值为Axis.horizontal，如果阅读方向是从左到右(取决于语言环境，阿拉伯语就是从右到左)，reverse为true时，那么滑动方向就是从右往左。其实此属性本质上是决定可滚动widget的初始滚动位置是在“头”还是“尾”，取false时，初始滚动位置在“头”，反之则在“尾”，读者可以自己试验。
primary：指是否使用widget树中默认的PrimaryScrollController；当滑动方向为垂直方向（scrollDirection值为Axis.vertical）并且controller没有指定时，primary默认为true.
*/
class ScrollableWidge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String string = "ABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";
    return Scrollbar(
       child: SingleChildScrollView(
         padding: EdgeInsets.only(left: 16),
         child: Center(
           child: Column(
             children: string.split("").map((e) => Text(e, textScaleFactor: 1.6)).toList(),
           ),
         ),
       ),
    );
  }
}