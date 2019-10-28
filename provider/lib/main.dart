import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'comsumer_demo.dart';
import 'provider_demo.dart';
import 'counter_model.dart';

void main() {

  runApp(MyApp());
}



class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      //通过Provider组件封装数据资源
      Provider.value(value: 30.0),
      ChangeNotifierProvider.value(value: CounterModel())//需要共享的数据资源
    ],child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage()
    ));

  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: TabBarView(
          children: [
            ConsumerTabPage1(),
            ProviderTabPage1(),
          ],
        ),
        bottomNavigationBar: TabBar(
          tabs: [
            Tab(icon: Icon(Icons.home),text: "Consumer",),
            Tab(icon: Icon(Icons.rss_feed),text: "Provider",),
          ],
          unselectedLabelColor: Colors.blueGrey,
          labelColor: Colors.blue,
          indicatorSize: TabBarIndicatorSize.label,
          indicatorColor: Colors.red,
        ),
      ),
    );
  }

}


