import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {

  /*
  *
  * const Image({
  ...
  this.width, //图片的宽
  this.height, //图片高度
  this.color, //图片的混合色值
  this.colorBlendMode, //混合模式
  this.fit,//缩放模式
  this.alignment = Alignment.center, //对齐方式
  this.repeat = ImageRepeat.noRepeat, //重复方式
  ...
})
  * */



  /*
  *
  * width、height：用于设置图片的宽、高，当不指定宽高时，图片会根据当前父容器的限制，尽可能的显示其原始大小，如果只设置width、height的其中一个，那么另一个属性默认会按比例缩放，但可以通过下面介绍的fit属性来指定适应规则。

    fit：该属性用于在图片的显示空间和图片本身大小不同时指定图片的适应模式。适应模式是在BoxFit中定义，它是一个枚举类型，有如下值：

    fill：会拉伸填充满显示空间，图片本身长宽比会发生变化，图片会变形。
    cover：会按图片的长宽比放大后居中填满显示空间，图片不会变形，超出显示空间部分会被剪裁。
    contain：这是图片的默认适应规则，图片会在保证图片本身长宽比不变的情况下缩放以适应当前显示空间，图片不会变形。
    fitWidth：图片的宽度会缩放到显示空间的宽度，高度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
    fitHeight：图片的高度会缩放到显示空间的高度，宽度会按比例缩放，然后居中显示，图片不会变形，超出显示空间部分会被剪裁。
    none：图片没有适应策略，会在显示空间内显示图片，如果图片比显示空间大，则显示空间只会显示图片中间部分。
  * */
  @override
  Widget build(BuildContext context) {
    String icons = "";
// accessible: &#xE914; or 0xE914 or E914
    icons += "\uE914";
// error: &#xE000; or 0xE000 or E000
    icons += " \uE000";
// fingerprint: &#xE90D; or 0xE90D or E90D
    icons += " \uE90D";


    return new Container(
      //Text
        child:  Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
//              Image(
//                image: AssetImage("images/avatar.jpeg"),
//                width: 100,
//              ),
//
//              Image.asset("images/avatar.jpeg",
//              width: 150,),
//
              Image(image: NetworkImage("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4"),
                width: 100,
                color: Colors.blue,
                colorBlendMode: BlendMode.difference,),

              Image.network("https://avatars2.githubusercontent.com/u/20411648?s=460&v=4", width: 100,),

              Image(image:  AssetImage("images/avatar.jpeg"),
              width: 100,
              color: Colors.blue,
              colorBlendMode: BlendMode.difference,),

              Image(
                image: AssetImage("images/avatar.jpeg"),
                width: 100.0,
                height: 200.0,
                repeat: ImageRepeat.repeat ,
              ),


              //字体图标
              Text(icons,
              style: TextStyle(fontFamily: "MaterialIcons",
                fontSize: 60,
                color: Colors.green
              ),
              ),
              Icon(Icons.accessible,color: Colors.green,),
              Icon(Icons.error,color: Colors.green,),
              Icon(Icons.fingerprint,color: Colors.green,),
            ]
        )
    );
  }
}
