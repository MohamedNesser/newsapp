
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webvew extends StatelessWidget {
final String url;
final String author;
webvew(this.url,this.author);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          centerTitle: true,
          title: Text( author,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),)

      ),
      body: WebView(
        initialUrl:url,
      ),
    );
  }
}
