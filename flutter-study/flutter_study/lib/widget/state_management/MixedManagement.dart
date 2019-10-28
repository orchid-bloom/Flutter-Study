import 'package:flutter/material.dart';

//父子都管理

class ParentWidgetC extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return new _ParentWidgetState();
  }
}

class _ParentWidgetState extends State<ParentWidgetC> {


  bool _active = false;

  void _handleTapboxChaned(bool newValue) {
   setState(() {
     _active = !_active;
   });
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new TapboxC(
          active: _active,
          onChanged: _handleTapboxChaned),
    );
  }
}

class TapboxC extends StatefulWidget {

  final bool active;
  final ValueChanged<bool> onChanged;

  TapboxC({Key key, this.active: false, @required this.onChanged}) : super (key: key);

  @override
  State<StatefulWidget> createState() => new _TapboxCState();
}

class _TapboxCState extends State<TapboxC> {

  bool _highlight = false;

  void _handleTapDown(TapDownDetails details) {
     setState(() {
       _highlight = true;
     });
  }

  void _handleTapUp(TapUpDetails details) {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTapCancel() {
    setState(() {
      _highlight = false;
    });
  }

  void _handleTap() {
    widget.onChanged(!widget.active);
  }

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
      onTap: _handleTap,
      onTapUp: _handleTapUp,
      onTapDown: _handleTapDown,
      onTapCancel: _handleTapCancel,
      child:  new Container(
        child:  new Center(
          child:  new Text(widget.active ? 'active': 'inactive',
          style: new TextStyle(fontSize: 32, color: Colors.white),),
        ),
        width: 200,
        height: 200,
        decoration:  new BoxDecoration(
          color:  widget.active ? Colors.lightGreen[700] : Colors.grey[600],
          border: _highlight ? new Border.all(
            color: widget.active ? Colors.teal[700] : Colors.teal[100],
            width: 10,
          ) : null
        ),
      ),
    );
  }
}