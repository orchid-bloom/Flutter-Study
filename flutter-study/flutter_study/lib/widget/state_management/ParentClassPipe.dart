import 'package:flutter/material.dart';

//父widget管理子widget状态。
class ParentWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State <ParentWidget> {

  bool _avtive = false;

  void _handkeTapboxChange(bool newValue){
    setState(() {
      _avtive = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
     child: new TapboxB(
         active: _avtive,
         onChanged: _handkeTapboxChange),
    );
  }
}

class TapboxB extends StatelessWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxB({Key key, this.active: false, @required this.onChanged}): super(key:key);

  void _handTap() {
    onChanged(!active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handTap,
      child: new Container(
        child: new Center(
          child: new Text(
            active ? "active" : "inactive",
            style: new TextStyle(
                fontSize: 32,
                color: Colors.white
            ),
          ),
        ),
        width: 200,
        height: 200,
        decoration: new BoxDecoration(
          color: active ? Colors.lightGreen[700] : Colors.grey[600],
        ),
      ),
    );
  }
}