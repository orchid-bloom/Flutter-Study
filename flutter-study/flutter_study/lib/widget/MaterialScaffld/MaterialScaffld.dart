import 'package:flutter/material.dart';
import 'LeftDrawer.dart';

//AppBar是一个Material风格的导航栏，它可以设置标题、导航栏菜单、底部Tab等。下面我们看看AppBar的定义：
/*
AppBar({
  Key key,
  this.leading, //导航栏最左侧Widget，常见为抽屉菜单按钮或返回按钮。
  this.automaticallyImplyLeading = true, //如果leading为null，是否自动实现默认的leading按钮
  this.title,// 页面标题
  this.actions, // 导航栏右侧菜单
  this.bottom, // 导航栏底部菜单，通常为Tab按钮组
  this.elevation = 4.0, // 导航栏阴影
  this.centerTitle, //标题是否居中
  this.backgroundColor,
  ...   //其它属性见源码注释
})
* */

class ScaffoldRoute extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => new _ScaffoldRouteState();
}

class _ScaffoldRouteState extends State<ScaffoldRoute>  with SingleTickerProviderStateMixin{
  int _selectedIndex = 0;
  TabController _tabController;
  List tabs = ["新闻","历史","图片"];

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: tabs.length, vsync: this);
    _tabController.addListener((){
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("App Name"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.share), onPressed: ()=>{
//            debugPrint("share")
          }),
        ],
        bottom: TabBar(
          controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
        leading: Builder(builder: (context) {
          return IconButton(
            icon: Icon(Icons.dashboard, color: Colors.white,),
            onPressed: ()=> {
              Scaffold.of(context).openDrawer()
            },
          );
        }),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(
            alignment: Alignment.center,
            child: Text(e, textScaleFactor: 5,),
          );
        }).toList(),
      ),
      drawer: LeftDrawer(),
      bottomNavigationBar:
//      BottomNavigationBar(
//        items: [
//          BottomNavigationBarItem(
//            icon: Icon(Icons.home),
//            title: Text("Home"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.business),
//            title: Text("Business"),
//          ),
//          BottomNavigationBarItem(
//            icon: Icon(Icons.school),
//            title: Text("School"),
//          )
//        ],
//        currentIndex: _selectedIndex,
//        fixedColor: Colors.blue,
//        onTap: _onTapItem,
//      ),
      BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        child: Row(
          children: <Widget>[
            IconButton(icon: Icon(Icons.home),onPressed: _onHome,),
            SizedBox(),
            IconButton(icon: Icon(Icons.business),onPressed: _onBusiness,)
          ],
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: _onAdd,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }


  _onTapItem(int index) {
    setState(() {
      _selectedIndex = index;
      _tabController.index = index;
    });
  }

  _onHome() {
    _selectedIndex = 0;
    _tabController.index = 0;
  }

  _onAdd() {
    _selectedIndex = 1;
    _tabController.index = 1;
  }

  _onBusiness() {
    _selectedIndex = 2;
    _tabController.index = 2;
  }
}