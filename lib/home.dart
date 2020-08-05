import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // 配置
  var arr = [
     {
       'text':'按钮示例',
       'link':'/button'
     },
     {
       'text':'流式布局示例',
       'link':'/layout'
     }
  ];
  
  // 组装配置信息
  List<Widget> _getButtons() {
    var tempList = arr.map((obj) {
        return  MyButton(obj['text'],obj['link']);
    });
    return tempList.toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          appBar: AppBar(title: Text('常用组件示例')),
          body: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: this._getButtons(), // 挂载
          ),
       );
  }
}

// 自定义button组件
class MyButton extends StatelessWidget {
  final String text;
  final String link;

  const MyButton(this.text,this.link, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
              child: Text(this.text),
              color: Colors.red,
              textColor: Colors.white,
              splashColor: Colors.black,
              highlightColor: Colors.green,
              onPressed: ()=>{
                Navigator.pushNamed(context, this.link,
                        arguments: {"text": this.text})
              }
    );
  }
}