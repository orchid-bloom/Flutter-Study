import 'package:flutter/material.dart';
import 'package:flutter_study/widget/StatelessWidget1.dart';
import 'package:flutter_study/widget/StatefulWidget1.dart';
import 'package:flutter_study/widget/state_management/ManageYourself.dart';
import 'package:flutter_study/widget/state_management/ParentClassPipe.dart';
import 'package:flutter_study/widget/state_management/MixedManagement.dart';
import 'package:flutter_study/widget/component/TextComponent.dart';
import 'package:flutter_study/widget/component/ButtonComponent.dart';
import 'package:flutter_study/widget/component/ImageComponent.dart';
import 'package:flutter_study/widget/component/SwitchAndCheckBoxComponent.dart';
import 'package:flutter_study/widget/component/TextFieldComponent.dart';
import 'package:flutter_study/widget/layout/LinearLayout.dart';
import 'package:flutter_study/widget/layout/FlexboxLayout.dart';
import 'package:flutter_study/widget/layout/WarpFlowLayout.dart';
import 'package:flutter_study/widget/layout/FrameLayout.dart';
import 'package:flutter_study/widget/container/PaddingContainer.dart';
import 'package:flutter_study/widget/container/LimitContainer.dart';
import 'package:flutter_study/widget/container/DecoratedContainer.dart';
import 'package:flutter_study/widget/container/TransformContainer.dart';
import 'package:flutter_study/widget/container/ContainerWidget.dart';
import 'package:flutter_study/widget/MaterialScaffld/MaterialScaffld.dart';
import 'package:flutter_study/widget/scrollable/ScrollableWidge.dart';
import 'package:flutter_study/widget/scrollable/ListViewWidget.dart';
import 'package:flutter_study/widget/scrollable/GridViewWedget.dart';
import 'package:flutter_study/widget/scrollable/CustomScrollViewWidget.dart';
import 'package:flutter_study/widget/scrollable/ScrollNotification.dart';
import 'package:flutter_study/widget/network/NetworkWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    home:
//      Echo(text: "我是测试数据", backgroundColor: Colors.blue,) //StatelessWidget
//    CounterWidget(initValue: 2) //StatelessWidget
//    CustomScrollViewWidget()
    MyHomePage(title: "UI"),
//        ScrollNotificationWidget()
//      ScaffoldRoute()
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:
//      Center(
//        child:
//        Column(
//          mainAxisAlignment: MainAxisAlignment.start,
//          children: <Widget>[
//            Echo(
//              text: "我是StatelessWidget1",
//              backgroundColor: Colors.green,
//            )
//            CounterWidget(),
//            TapboxA(),
//            ParentWidget(),
//            ParentWidgetC(),
//            ParentWidgetC(),
//              TextComponent(),
//            ButtonComponent(),
//            ImageComponent(),
//            SwitchAndCheckBoxComponent(),
//            TextFieldComponent(),
//            LinearLayout(),
//            FlexboxLayout(),
//            WarpFlowLayout(),
//            FrameLayout(),
//            PaddingContainer(),
//            LimitContainer()
//            DecoratedContainer(),
//            TransformContainer(),
//            ContainerContainer(),
//            ScrollableWidge(),
//            ListViewWidget(),
//            GridViewWedget(),
              NetworkWidget(),
//          ],
//        ),
//      )
    );
  }
}
