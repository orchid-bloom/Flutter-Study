import 'package:flutter/material.dart';

//ConstrainedBox和SizedBox都是通过RenderConstrainedBox来渲染的
//ConstrainedBox用于对子widget添加额外的约束
// BoxConstraints BoxConstraints用于设置限制条件
// const BoxConstraints({
//  this.minWidth = 0.0, //最小宽度
//  this.maxWidth = double.infinity, //最大宽度
//  this.minHeight = 0.0, //最小高度
//  this.maxHeight = double.infinity //最大高度
//})



// SizedBox
// SizedBox用于给子widget指定固定的宽高





// 而实际上ConstrainedBox和SizedBox都是通过RenderConstrainedBox来渲染的，我们可以看到ConstrainedBox和SizedBox的createRenderObject()方法都返回的是一个RenderConstrainedBox对象：




//UnconstrainedBox
//UnconstrainedBox不会对子Widget产生任何限制，它允许其子Widget按照其本身大小绘制。一般情况下，我们会很少直接使用此widget，但在"去除"多重限制的时候也许会有帮助，我们看下下面的代码：
class LimitContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget rebox= DecoratedBox(
      decoration: BoxDecoration(color: Colors.red),
    );
    return ConstrainedBox(
        constraints:
//        BoxConstraints.tightFor(width: 80, height: 80),
//          BoxConstraints(minHeight: 80.0,maxHeight: 80.0,minWidth: 80.0,maxWidth: 80.0),
        BoxConstraints(
          minWidth:  30,
          minHeight: 50.0,
        ),
        child:
//      Container(
//        height: 5,
//        child:  rebox,
//      ),
        SizedBox(
          width: 80,
          height: 100,
          child: rebox,
        )
    );

    //多重限制
    //通过上面示例，我们发现有多重限制时，对于minWidth和minHeight来说，是取父子中相应数值较大的。实际上，只有这样才能保证父限制与子限制不冲突。
    return ConstrainedBox(
      constraints: BoxConstraints(minWidth: 60, minHeight:  60),
      child:  ConstrainedBox(
        constraints: BoxConstraints(minWidth: 90, minHeight: 20),
        child: rebox,
      ),);


      // 但是，读者请注意，UnconstrainedBox对父限制的“去除”并非是真正的去除，上面例子中虽然红色区域大小是90×20，但上方仍然有80的空白空间。也就是说父限制的minHeight(100.0)仍然是生效的，只不过它不影响最终子元素redBox的大小，但仍然还是占有相应的空间，可以认为此时的父ConstrainedBox是作用于子UnconstrainedBox上，而redBox只受子ConstrainedBox限制，这一点请读者务必注意。
     // 那么有什么方法可以彻底去除父BoxConstraints的限制吗？答案是否定的！所以在此提示读者，在定义一个通用的widget时，如果对子widget指定限制时一定要注意，因为一旦指定限制条件，子widget如果要进行相关自定义大小时将可能非常困难，因为子widget在不更改父widget的代码的情况下无法彻底去除其限制条件。
//      return ConstrainedBox(
//        constraints: BoxConstraints(minWidth: 60, minHeight: 100),
//        child: UnconstrainedBox(
//          child: ConstrainedBox(
//            constraints: BoxConstraints(minWidth: 20, minHeight: 20),
//            child: rebox,
//          ),
//        ),
//      );


    //当我们发现已经使用SizedBox或ConstrainedBox来给子元素指定宽高，但是仍然没有效果时，几乎可以肯定：已经有父元素已经设置了限制；举个例子如导航栏的右侧菜单中，我们已经使用SizedBox指定了loading按钮的大小：
//     return AppBar(
//      title: Text("哈啊"),
//      actions: <Widget>[
//        SizedBox(
//          width: 11,
//          height: 11,
//          child: CircularProgressIndicator(
//            strokeWidth: 3,
//            valueColor: AlwaysStoppedAnimation(Colors.white70),
//          ),
//        )
//      ],
//    );

     //上面代码运行后，我们会发现loading按钮大小并没有发生变化，这正是因为AppBar中已经指定了actions按钮的限制条件，此时我们便可以通过UnconstrainedBox来去除父元素的限制:
    return  AppBar(
      title: Text("哈啊"),
      actions: <Widget>[
        UnconstrainedBox(
          child: SizedBox(
            width: 20,
            height: 20,
            child: CircularProgressIndicator(
              strokeWidth: 3,
              valueColor: AlwaysStoppedAnimation(Colors.white70),
            ),
          ),
        )
      ],
    );
  }
}