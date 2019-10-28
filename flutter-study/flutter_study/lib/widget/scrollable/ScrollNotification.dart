import 'package:flutter/material.dart';


//ScrollNotification 通知进行滚动事件的获取
class ScrollNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: "ScrollController Demo",
      home: Scaffold(
        body: NotificationListener<ScrollNotification>(
          onNotification: (scrollNotification) {
            double offsetY = scrollNotification.metrics.pixels;
            print(offsetY.toString());
            if (scrollNotification is ScrollStartNotification) {
              print("ScrollStartNotification");
            } else if (scrollNotification is ScrollUpdateNotification) {
              print("ScrollUpdateNotification");
            } else if (scrollNotification is ScrollEndNotification) {
              print("ScrollEndNotification");
            }
            return true;
          },
          child: ListView.builder(
            itemBuilder: (context, index)=> Text('${index}'),
            itemCount: 100,
          ),
        ),
      ),
    );
  }
}
