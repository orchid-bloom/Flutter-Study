import 'package:flutter/material.dart';


class TextFieldComponent extends StatefulWidget {



  /*
  *
  * const TextField({
  ...
  TextEditingController controller,
  FocusNode focusNode,
  InputDecoration decoration = const InputDecoration(),
  TextInputType keyboardType,
  TextInputAction textInputAction,
  TextStyle style,
  TextAlign textAlign = TextAlign.start,
  bool autofocus = false,
  bool obscureText = false,
  int maxLines = 1,
  int maxLength,
  bool maxLengthEnforced = true,
  ValueChanged<String> onChanged,
  VoidCallback onEditingComplete,
  ValueChanged<String> onSubmitted,
  List<TextInputFormatter> inputFormatters,
  bool enabled,
  this.cursorWidth = 2.0,
  this.cursorRadius,
  this.cursorColor,
  ...
})
*/


  /*
  * controller：编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件。大多数情况下我们都需要显式提供一个controller来与文本框交互。如果没有提供controller，则TextField内部会自动创建一个。

focusNode：用于控制TextField是否占有当前键盘的输入焦点。它是我们和键盘交互的一个handle。

InputDecoration：用于控制TextField的外观显示，如提示文本、背景颜色、边框等。

keyboardType：用于设置该输入框默认的键盘输入类型，取值如下：

| TextInputType枚举值 | 含义 | | ------------------- | --------------------------------------------------- | | text | 文本输入键盘 | | multiline | 多行文本，需和maxLines配合使用(设为null或大于1) | | number | 数字；会弹出数字键盘 | | phone | 优化后的电话号码输入键盘；会弹出数字键盘并显示"* #" | | datetime | 优化后的日期输入键盘；Android上会显示“: -” | | emailAddress | 优化后的电子邮件地址；会显示“@ .” | | url | 优化后的url输入键盘； 会显示“/ .” |

textInputAction：键盘动作按钮图标(即回车键位图标)，它是一个枚举值，有多个可选值，全部的取值列表读者可以查看API文档，下面是当值为TextInputAction.search时，原生Android系统下键盘样式：

style：正在编辑的文本样式。
textAlign: 输入框内编辑文本在水平方向的对齐方式。
autofocus: 是否自动获取焦点。
obscureText：是否隐藏正在编辑的文本，如用于输入密码的场景等，文本内容会用“•”替换。  密文
maxLines：输入框的最大行数，默认为1；如果为null，则无行数限制。
maxLength和maxLengthEnforced ：maxLength代表输入框文本的最大长度，设置后输入框右下角会显示输入的文本计数。maxLengthEnforced决定当输入文本长度超过maxLength时是否阻止输入，为true时会阻止输入，为false时不会阻止输入但输入框会变红。
onChange：输入框内容改变时的回调函数；注：内容改变事件也可以通过controller来监听。
onEditingComplete和onSubmitted：这两个回调都是在输入框输入完成时触发，比如按了键盘的完成键（对号图标）或搜索键（🔍图标）。不同的是两个回调签名不同，onSubmitted回调是ValueChanged<String>类型，它接收当前输入内容做为参数，而onEditingComplete不接收参数。
inputFormatters：用于指定输入格式；当用户输入内容改变时，会根据指定的格式来校验。
enable：如果为false，则输入框会被禁用，禁用状态不接收输入和事件，同时显示禁用态样式（在其decoration中定义）。
cursorWidth、cursorRadius和cursorColor：这三个属性是用于自定义输入框光标宽度、圆角和颜色的。
  *
  * */
  @override
  State<StatefulWidget> createState() {
    return new _TextFieldComponentState();
  }
}

class _TextFieldComponentState extends State <TextFieldComponent> {
  TextEditingController _selectionController = new TextEditingController();
  FocusNode focusNode1 = new FocusNode();
  FocusNode focusNode2 = new FocusNode();
  FocusScopeNode focusScopeNode;

  @override
  void initState() {
    //监听输入改变
    _selectionController.addListener((){
      print(_selectionController.text);
    });

    _selectionController.text="hello world!";
    _selectionController.selection=TextSelection(
        baseOffset: 2,
        extentOffset: _selectionController.text.length
    );

    focusNode1.addListener(() {
      print(focusNode1.hasFocus.toString());
    });

    focusNode2.addListener(() {
      print(focusNode2.hasFocus.toString());
    });
  }


  @override
  Widget build(BuildContext context) {
    return new Container(

        child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[

              TextField(
                  controller: _selectionController,
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "用户名",
                    hintText: "用户名或邮箱",
                    prefixIcon: Icon(Icons.person),
                  ),
                  focusNode: focusNode1,//关联focusNode1
                  onChanged: (v) {
                    print("onChange: $v");
                  }
              ),
              TextField(
                decoration: InputDecoration(
                    labelText: "密码",
                    hintText: "您的登录密码",
                    prefixIcon: Icon(Icons.lock)
                ),
                focusNode: focusNode2,//关联focusNode2
                obscureText: true,
                textInputAction:TextInputAction.go,
              ),


              Builder(builder: (ctx) {
                return Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text("移动焦点"),
                      onPressed: () {
                        //将焦点从第一个TextField移到第二个TextField
                        // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                        // 这是第二种写法
                        if(null == focusScopeNode){
                          focusScopeNode = FocusScope.of(context);
                        }
                        focusScopeNode.requestFocus(focusNode2);
                      },
                    ),
                    RaisedButton(
                      child: Text("隐藏键盘"),
                      onPressed: () {
                        // 当所有编辑框都失去焦点时键盘就会收起
                        focusNode1.unfocus();
                        focusNode2.unfocus();
                      },
                    ),
                  ],
                );
              },
              ),
            ]
        )
    );

  }
}