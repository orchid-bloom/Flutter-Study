import 'package:flutter/material.dart';
import 'counter_model.dart';
import 'package:provider/provider.dart';
import 'test_icon.dart';

class ConsumerTabPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _counter = Provider.of<CounterModel>(context);
    final textSize = Provider.of<double>(context);
    return Scaffold(
      appBar: AppBar(

        title: Text('First Page'),
      ),
      body: Center(
        child: Text(
          'Counter: ${_counter.counter}',
          style: TextStyle(fontSize: textSize),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConsumerTabPage2())),
        child: Icon(Icons.navigate_next),
      ),
    );
  }
}

class ConsumerTabPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Second Page'),
      ),
      body: Consumer2<CounterModel,double>(//滥用 Provider.of 方法也有副作用，那就是当数据更新时，页面中其他的子 Widget 也会跟着一起刷新
          builder: (context, CounterModel counter, double textSize, _) => Text(
              'Counter: ${counter.counter}',
              style: TextStyle(fontSize: textSize))
      ),
      floatingActionButton: Consumer<CounterModel>(
        builder: (context, CounterModel counter, child) => FloatingActionButton(
          onPressed: counter.increment,
          child: child,
        ),
        child: TestIcon(),
      ),
    );
  }
}