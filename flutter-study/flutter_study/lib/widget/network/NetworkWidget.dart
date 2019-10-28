import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';



class NetworkWidget extends StatelessWidget {

  _networkTest() async {
    //创建网络调用示例，设置通用请求行为(超时时间)
    var httpClient = HttpClient();
    httpClient.idleTimeout = Duration(seconds: 5);    //构造URI，设置user-agent为"Custom-UA"
    var uri = Uri.parse("https://flutter.dev");
    var request = await httpClient.getUrl(uri);
    request.headers.add("user-agent", "Custom-UA");    //发起请求，等待响应
    var response = await request.close();    //收到响应，打印结果
    if (response.statusCode == HttpStatus.ok) {
      print(await response.transform(utf8.decoder).join());
    } else {
      print('Error: \nHttp status ${response.statusCode}');
    }
  }

  _storeFile() {
    writeContent("测试");

    var str = readContent();

    print(str);
  }

  //创建文件目录
  Future<File> get _localFile async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    return File('$path/content.txt');
  }
//将字符串写入文件
  Future<File> writeContent(String content) async {
    final file = await _localFile;
    return file.writeAsString(content);
  }
//从文件读出字符串
  Future<String> readContent() async {
    try {
      final file = await _localFile;
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {

    _networkTest();
    _storeFile();

    return Container(
      margin: const EdgeInsets.only(left: 100,top: 100,right: 0, bottom: 400),
      constraints: BoxConstraints(minWidth: 200,minHeight: 200),
      decoration: BoxDecoration(
          gradient: RadialGradient(colors: [Colors.red, Colors.orange],
              center: Alignment.topLeft,
              radius: 0.98),
          boxShadow: [
            BoxShadow(
                color: Colors.black54,
                offset: Offset(2, 2),
                blurRadius: 6
            )]
      ),
      transform: Matrix4.rotationZ(.2),
      alignment: Alignment.center,
      child: Text("网络和存储", style:  TextStyle(color: Colors.white, fontSize: 40.0),),
    );
  }
}