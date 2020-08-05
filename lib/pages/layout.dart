import 'package:flutter/material.dart';

class LayoutPage extends StatelessWidget {
  final arguments;

  const LayoutPage({Key key,this.arguments}) : super(key: key);

  // 配置
  static const arr = [
     {
       'text':'Wrap布局示例',
       'link':'/wrap'
     },
     {
       'text':'Flow布局示例',
       'link':'/flow'
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
      appBar: AppBar(title: Text(arguments['text']),),
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