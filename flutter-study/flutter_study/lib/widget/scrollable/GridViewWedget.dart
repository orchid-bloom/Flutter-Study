import 'package:flutter/material.dart';


//GridView可以构建一个二维网格列表，其默认构造函数定义如下：
//GridView({
//  Axis scrollDirection = Axis.vertical,
//  bool reverse = false,
//  ScrollController controller,
//  bool primary,
//  ScrollPhysics physics,
//  bool shrinkWrap = false,
//  EdgeInsetsGeometry padding,
//  @required SliverGridDelegate gridDelegate, //控制子widget layout的委托
//  bool addAutomaticKeepAlives = true,
//  bool addRepaintBoundaries = true,
//  double cacheExtent,
//  List<Widget> children = const <Widget>[],
//})


//Flutter中提供了两个SliverGridDelegate的子类SliverGridDelegateWithFixedCrossAxisCount和SliverGridDelegateWithMaxCrossAxisExtent，下面我们分别介绍：
//SliverGridDelegateWithFixedCrossAxisCount  该子类实现了一个横轴为固定数量子元素的layout算法，其构造函数为：

//SliverGridDelegateWithFixedCrossAxisCount({
//  @required double crossAxisCount,
//  double mainAxisSpacing = 0.0,
//  double crossAxisSpacing = 0.0,
//  double childAspectRatio = 1.0,
//})

/*
crossAxisCount：横轴子元素的数量。此属性值确定后子元素在横轴的长度就确定了,即ViewPort横轴长度/crossAxisCount。
mainAxisSpacing：主轴方向的间距。
crossAxisSpacing：横轴方向子元素的间距。
childAspectRatio：子元素在横轴长度和主轴长度的比例。由于crossAxisCount指定后子元素横轴长度就确定了，然后通过此参数值就可以确定子元素在主轴的长度。
* */









//GridView.count
//GridView.count构造函数内部使用了SliverGridDelegateWithFixedCrossAxisCount，我们通过它可以快速的创建横轴固定数量子元素的GridView，上面的示例代码等价于：






//SliverGridDelegateWithMaxCrossAxisExtent  该子类实现了一个横轴子元素为固定最大长度的layout算法，其构造函数为：
/*
SliverGridDelegateWithMaxCrossAxisExtent({
  double maxCrossAxisExtent,
  double mainAxisSpacing = 0.0,
  double crossAxisSpacing = 0.0,
  double childAspectRatio = 1.0,
})
* */
//maxCrossAxisExtent为子元素在横轴上的最大长度，之所以是“最大”长度，是因为横轴方向每个子元素的长度仍然是等分的，举个例子，如果ViewPort的横轴长度是450，那么当maxCrossAxisExtent的值在区间[450/4，450/3)内的话，子元素最终实际长度都为112.5，而childAspectRatio所指的子元素横轴和主轴的长度比为最终的长度比。其它参数和SliverGridDelegateWithFixedCrossAxisCount相同。

//GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，我们通过它可以快速的创建纵轴子元素为固定最大长度的的GridView，上面的示例代码等价于：




//GridView.builder
//上面我们介绍的GridView都需要一个Widget数组作为其子元素，这些方式都会提前将所有子widget都构建好，所以只适用于子Widget数量比较少时，当子widget比较多时，我们可以通过GridView.builder来动态创建子Widget。GridView.builder 必须指定的参数有两个：
class GridViewWedget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _GridViewWedgetState();
  }
}

class _GridViewWedgetState extends State<GridViewWedget> {
  @override
  Widget build(BuildContext context) {


    //SliverGridDelegateWithFixedCrossAxisCount example

//    return GridView(
//        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//          crossAxisCount: 3,
//          childAspectRatio: 2,
//        ),
//      children: <Widget>[
//        Icon(Icons.ac_unit),
//        Icon(Icons.airport_shuttle),
//        Icon(Icons.all_inclusive),
//        Icon(Icons.beach_access),
//        Icon(Icons.cake),
//        Icon(Icons.free_breakfast)
//      ],
//    );





//     return GridView.count(
//       crossAxisCount: 3,
//       childAspectRatio: 1.0,
//       children: <Widget>[
//         Icon(Icons.ac_unit),
//         Icon(Icons.airport_shuttle),
//         Icon(Icons.all_inclusive),
//         Icon(Icons.beach_access),
//         Icon(Icons.cake),
//         Icon(Icons.free_breakfast),
//       ],
//     );



    //SliverGridDelegateWithMaxCrossAxisExtent  example
//    return GridView(
//      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
//          maxCrossAxisExtent: 100,
//          childAspectRatio: 2.0),
//      children: <Widget>[
//        Icon(Icons.ac_unit),
//        Icon(Icons.airport_shuttle),
//        Icon(Icons.all_inclusive),
//        Icon(Icons.beach_access),
//        Icon(Icons.cake),
//        Icon(Icons.free_breakfast),
//      ],
//    );


    //GridView.extent
    //GridView.extent构造函数内部使用了SliverGridDelegateWithMaxCrossAxisExtent，我们通过它可以快速的创建纵轴子元素为固定最大长度的的GridView，上面的示例代码等价于：
//    return GridView.extent(
//      maxCrossAxisExtent: 100,
//      childAspectRatio: 2.0,
//      children: <Widget>[
//        Icon(Icons.ac_unit),
//        Icon(Icons.airport_shuttle),
//        Icon(Icons.all_inclusive),
//        Icon(Icons.beach_access),
//        Icon(Icons.cake),
//        Icon(Icons.free_breakfast),
//      ],
//    );


    //GridView.builder
    //上面我们介绍的GridView都需要一个Widget数组作为其子元素，这些方式都会提前将所有子widget都构建好，所以只适用于子Widget数量比较少时，当子widget比较多时，我们可以通过GridView.builder来动态创建子Widget。GridView.builder 必须指定的参数有两个：
    //GridView.builder(
    // ...
    // @required SliverGridDelegate gridDelegate,
    // @required IndexedWidgetBuilder itemBuilder,
    //)






    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            childAspectRatio: 1.0),
        itemCount: _icons.length,
        itemBuilder: (context, index) {
          if (index == _icons.length - 1 && _icons.length < 200) {
             _retrieveIcons();
          }
          return Icon(_icons[index]);
        });
  }

  List<IconData> _icons = [];

  @override
  void initState() {
    super.initState();
    _retrieveIcons();
  }

  void _retrieveIcons() {
    Future.delayed(Duration(milliseconds: 200)).then((e) {
      setState(() {
        _icons.addAll([
          Icons.ac_unit,
          Icons.airport_shuttle,
          Icons.all_inclusive,
          Icons.beach_access,
          Icons.cake,
          Icons.free_breakfast
        ]);
      });
    });
  }
}

//flutter_staggered_grid_view