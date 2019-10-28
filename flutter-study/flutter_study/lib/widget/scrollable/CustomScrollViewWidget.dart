import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

//我们可以使用 ScrollController 进行滚动信息的监听，以及相应的滚动控制

class CustomScrollViewWidget extends StatefulWidget {
   @override
  State<StatefulWidget> createState() {
    return new _CustomScrollViewWidgetState();
  }
}

class _CustomScrollViewWidgetState extends State<CustomScrollViewWidget> {

  ScrollController _controller = new ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    _controller.addListener(() {
       print(_controller.offset);
       if (_controller.offset < 1000 && showToTopBtn) {
         setState(() {
           showToTopBtn = false;
         });
       } else if (_controller.offset > 1000 && showToTopBtn == false) {
         setState(() {
           showToTopBtn = true;
         });
       }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //因为本路由没有使用Scaffold，为了让子级Widget(如Text)使用
    //Material Design 默认的样式风格,我们使用Material作为本路由的根。
    return Scaffold(
      appBar: AppBar(title: Text('滚动'),),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
        child: Icon(Icons.arrow_upward),
        onPressed: () {
          _controller.animateTo( 0,
              duration: Duration(milliseconds: 300),
              curve: Curves.ease
          );
        },
      ),
      body: Material(
        child: CustomScrollView(
          controller: _controller,
          slivers: <Widget>[
            //AppBar，包含一个导航栏
            SliverAppBar(
              pinned: true,
              expandedHeight: 250.0,
              flexibleSpace: FlexibleSpaceBar(
                title: const Text('Demo'),
                background: Image.asset(
                  "./images/avatar.jpeg", fit: BoxFit.cover,),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: new SliverGrid( //Grid
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建子widget
                    return new Container(
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: new Text('grid item $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),


            //List
            new SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建列表项
                    return new Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: new Text('list item $index'),
                    );
                  },
                  childCount: 50 //50个列表项
              ),
            ),


            new SliverFixedExtentList(
              itemExtent: 50.0,
              delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建列表项
                    return new Container(
                      alignment: Alignment.center,
                      color: Colors.lightBlue[100 * (index % 9)],
                      child: new Text('list item $index'),
                    );
                  },
                  childCount: 50 //50个列表项
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: new SliverGrid( //Grid
                gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, //Grid按两列显示
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                  childAspectRatio: 4.0,
                ),
                delegate: new SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    //创建子widget
                    return new Container(
                      alignment: Alignment.center,
                      color: Colors.cyan[100 * (index % 9)],
                      child: new Text('grid item $index'),
                    );
                  },
                  childCount: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}