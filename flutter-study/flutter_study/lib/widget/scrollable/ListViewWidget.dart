import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class ListViewWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ListViewWidget();
  }
}


//ListView是最常用的可滚动widget，它可以沿一个方向线性排布所有子widget
/*
ListView({
  ...
  //可滚动widget公共参数
  Axis scrollDirection = Axis.vertical,
  bool reverse = false,
  ScrollController controller,
  bool primary,
  ScrollPhysics physics,
  EdgeInsetsGeometry padding,

  //ListView各个构造函数的共同参数
  double itemExtent,
  bool shrinkWrap = false,
  bool addAutomaticKeepAlives = true,
  bool addRepaintBoundaries = true,
  double cacheExtent,

  //子widget列表
  List<Widget> children = const <Widget>[],
})
* */


/*
itemExtent：该参数如果不为null，则会强制children的"长度"为itemExtent的值；这里的"长度"是指滚动方向上子widget的长度，即如果滚动方向是垂直方向，则itemExtent代表子widget的高度，如果滚动方向为水平方向，则itemExtent代表子widget的长度。在ListView中，指定itemExtent比让子widget自己决定自身长度会更高效，这是因为指定itemExtent后，滚动系统可以提前知道列表的长度，而不是总是动态去计算，尤其是在滚动位置频繁变化时（滚动系统需要频繁去计算列表高度）。
shrinkWrap：该属性表示是否根据子widget的总长度来设置ListView的长度，默认值为false 。默认情况下，ListView的会在滚动方向尽可能多的占用空间。当ListView在一个无边界(滚动方向上)的容器中时，shrinkWrap必须为true。
addAutomaticKeepAlives：该属性表示是否将列表项（子widget）包裹在AutomaticKeepAlive widget中；典型地，在一个懒加载列表中，如果将列表项包裹在AutomaticKeepAlive中，在该列表项滑出视口时该列表项不会被GC，它会使用KeepAliveNotification来保存其状态。如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
addRepaintBoundaries：该属性表示是否将列表项（子widget）包裹在RepaintBoundary中。当可滚动widget滚动时，将列表项包裹在RepaintBoundary中可以避免列表项重绘，但是当列表项重绘的开销非常小（如一个颜色块，或者一个较短的文本）时，不添加RepaintBoundary反而会更高效。和addAutomaticKeepAlive一样，如果列表项自己维护其KeepAlive状态，那么此参数必须置为false。
* */
class _ListViewWidget extends State<ListViewWidget> {







  static const loadingTag = "##loading##";
  var _words = <String>[loadingTag];

  @override
  void initState() {
    super.initState();

    _retrieveData();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 2)).then((e) {
      _words.insertAll(_words.length - 1,
          //每次生成20个单词
          generateWordPairs().take(20).map((e) => e.asPascalCase).toList()
      );
      setState(() {
        //重新构建列表
      });
    });
  }

  @override
  Widget build(BuildContext context) {


//    return ListView(
//      padding: EdgeInsets.all(15),
//      children: <Widget>[
//        const Text('I\'m dedicating every day to you'),
//        const Text('Domestic life was never quite my style'),
//        const Text('When you smile, you knock me out, I fall apart me out, I fall apart me out, I fall apart me out, I fall apart me out, I fall apart'),
//        const Text('And I thought I was so smart'),
//      ],
//    );
//


//    ListView.builder
//    itemBuilder：它是列表项的构建器，类型为IndexedWidgetBuilder，返回值为一个widget。当列表滚动到具体的index位置时，会调用该构建器构建列表项。
////    itemCount：列表项的数量，如果为null，则为无限列表。
//    return ListView.builder(
//        itemCount: 100,
//        itemExtent: 50,
//        itemBuilder: (BuildContext content, int index) {
//          return ListTile(title: Text("$index"),);
//        });



    //ListView.separated可以生成列表项之间的分割器，它除了比ListView.builder多了一
    //下划线widget预定义以供复用。
//    Widget divider1=Divider(color: Colors.blue,);
//    Widget divider2=Divider(color: Colors.green);
//    return ListView.separated(itemBuilder: (BuildContext content, int index) {
//      return ListTile(
//        title: Text("$index"),
//      );
//    }, separatorBuilder: (BuildContext content, int index) {
//      return index % 2 == 0 ? divider1 : divider2;
//    }, itemCount: 100);


    return Column(
      children: <Widget>[
        ListTile(title: Text("商品列表"),) ,
//       SizedBox(
//         height: MediaQuery.of(context).size.height - 24 - 56 - 56 - 20,
//         child: ListView.separated(
//             itemBuilder: (BuildContext context, int index) {
//               if (_words[index] == loadingTag) {
//                 if (_words.length - 1 < 100) {
//                   _retrieveData();
//                   return Container(
//                     padding:  const EdgeInsets.all(16.0),
//                     alignment: Alignment.center,
//                     child: SizedBox(
//                       width: 24.0,
//                       height: 24.0,
//                       child: CircularProgressIndicator(
//                         strokeWidth: 2.0,
//                       ),
//                     ),
//                   );
//                 } else {
//                   return Container(
//                     alignment: Alignment.center,
//                     padding: EdgeInsets.all(16.0),
//                     child: Text("---------我是有底线的--------", style: TextStyle(color: Colors.grey),),
//                   );
//                 }
//               }
//               return ListTile(
//                 title: Text(_words[index]),
//               );
//             },
//             separatorBuilder: (BuildContext context, int index) {
//               return Divider(color: Colors.black,height: 0.5,);
//             },
//             itemCount: _words.length),
//       )
        Expanded(
            child: ListView.separated(
                itemBuilder: (BuildContext context, int index) {
                  if (_words[index] == loadingTag) {
                    if (_words.length - 1 < 100) {
                      _retrieveData();
                      return Container(
                        padding:  const EdgeInsets.all(16.0),
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 24.0,
                          height: 24.0,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.0,
                          ),
                        ),
                      );
                    } else {
                      return Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(16.0),
                        child: Text("---------我是有底线的--------", style: TextStyle(color: Colors.grey),),
                      );
                    }
                  }
                  return ListTile(
                    title: Text(_words[index]),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Padding(padding: EdgeInsets.only(
                      left: 15),
                      child: Divider(color: Colors.black,
                                     height: 0.5,
                      ),
                  );
                },
                itemCount: _words.length))
      ],
    );
  }
}