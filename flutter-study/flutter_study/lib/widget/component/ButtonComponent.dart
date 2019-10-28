import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Container(
        //Text
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[

            RaisedButton( // RaisedButton 即"漂浮"按钮，它默认带有阴影和灰色背景。按下后，阴影会变大，如：
              child: Text("nolmal"),
              onPressed: ()=>{debugPrint("RaisedButton nolmal")},
            ),
            
            FlatButton(  //FlatButton即扁平按钮，默认背景透明并不带阴影。按下后，会有背景色：
            child: Text("normal"),
              onPressed: ()=> {debugPrint("FlatButton normal")},
            ),

            OutlineButton(  //OutlineButton默认有一个边框，不带阴影且背景透明。按下后，边框颜色会变亮、同时出现背景和阴影(较弱):
            child: Text("normal"),
              onPressed: ()=> {debugPrint("OutlineButton normal")},
            ),

            IconButton(  // IconButton是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景:
              icon: Icon(Icons.timer),
              onPressed: ()=> {debugPrint("IconButton normal")},
            ),


            //自定义按钮外观
            FlatButton(
              color: Colors.blue, //Color(0x000000)  透明色
              highlightColor: Colors.blue[700],
              colorBrightness: Brightness.dark,
              splashColor: Colors.grey,
              child: Text("Submit"),
              shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
              onPressed: () => {debugPrint("自定义按钮")},
            )

          ]
        )
    );
  }
}

