import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

const appStyle = const TextStyle(
  fontFamily: 'Raleway',
  package: 'package:flutter_study/widget', //指定包名
);

class TextComponent extends StatelessWidget {

  final textStyle = const TextStyle(
    fontFamily: 'AbrilFatface',
  );

  TapGestureRecognizer _tapRecognizer() {
    TapGestureRecognizer tap = new TapGestureRecognizer();
    tap.onTap = ()=> {
       debugPrint("被点击了")
    };
    return tap;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
       color: Colors.yellow,
       //Text
       child:  Column(
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
           Text("Hello world! I'm Jack. "*4,
               textAlign: TextAlign.center,      // 对齐方式
               maxLines: 4,
               overflow:  TextOverflow.ellipsis, // 省略方式
               textScaleFactor: 1.5,             // //放大
               style: new TextStyle(
                 color: Colors.green,
                 fontSize: 12,
                 fontFamily: 'Courier',
                 background: new Paint()..color=Colors.redAccent,
                 decoration: TextDecoration.underline,
                 decorationStyle: TextDecorationStyle.dashed
               ),
           ),
           Text.rich(TextSpan(
             children: [TextSpan(
                 text: "Home:"
             ),
             TextSpan(
               text: "https://www.jianshu.com/u/fb6c72d338f8",  //(富文本)的widget
               style: TextStyle(
                 color: Colors.blue[300],
               ),
               recognizer: _tapRecognizer(),
             )]
           )),



           DefaultTextStyle(// 在widget树中，文本的样式默认是可以被继承的，因此，如果在widget树的某一个节点处设置一个默认的文本样式，那么该节点的子树中所有文本都会默认使用这个样式，而DefaultTextStyle正是用于设置默认文本样式的。下面我们看一个例子：

             //1.设置文本默认样式
             style: TextStyle(
               color:Colors.red,
               fontSize: 20.0,
             ),
             textAlign: TextAlign.start,
             child: Column(
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Text("hello world"),
                 Text("I am Jack"),
                 Text("I am Jack",
                   style: TextStyle(
                       inherit: false, //2.不继承默认样式
                       color: Colors.grey
                   ),
                 ),
               ],
             ),
           ),






           Text(
             "Use the font for this text",
             style: textStyle,
           ),

           Text(
             "Use the font for this text",
             style: appStyle,
           ),
         ],
       )
    );
  }
}