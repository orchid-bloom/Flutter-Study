import 'package:flutter/material.dart';

class Echo extends StatelessWidget {

  const Echo({Key key, this.text, this.backgroundColor: Colors.grey}): super(key: key);

  final String text;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        body: Center(
          child: Container(
            color: backgroundColor,
            child: Text(
                text
            ),
          ),
        ),
      );
  }
}

/*

class Text extends StatelessWidget {
  //构造方法及属性声明部分
  const Text(this.data, {
    Key key,
    this.textAlign,
    this.textDirection,
    //其他参数
    ...
  }) : assert(data != null),
     textSpan = null,
     super(key: key);

  final String data;
  final TextAlign textAlign;
  final TextDirection textDirection;
  //其他属性
  ...

  @override
  Widget build(BuildContext context) {
    ...
    Widget result = RichText(
       //初始化配置
       ...
      )
    );
    ...
    return result;
  }
}

* */