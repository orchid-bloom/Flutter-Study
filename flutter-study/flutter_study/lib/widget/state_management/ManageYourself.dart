import 'package:flutter/material.dart';

//Widget管理自己的state

class TapboxA extends StatefulWidget {
  TapboxA({Key key}): super(key: key);

  @override
  State<StatefulWidget> createState() {
    return new _TapboxA_State();
  }
}

class _TapboxA_State extends State<TapboxA> {

  bool _active = false;

  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      child: new Container(
        child:Center(
          child: new Text(
            _active ? "Active" : "InActive",
            style: new TextStyle(
                fontSize: 32,
                color: Colors.white),
          ),
        ),
        width: 200,
        height: 200,
        decoration:  new BoxDecoration(
          color: _active ? Colors.lightGreen[700] : Colors.grey[600]
        ),
      ),
    );
  }

}