import 'dart:async';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
class AirticleView extends StatefulWidget {
  final String articleurl;

  const AirticleView({Key key,@required this.articleurl}) : super(key: key);

  @override
  _AirticleViewState createState() => _AirticleViewState();
}

class _AirticleViewState extends State<AirticleView> {
  bool _isloaded = true ;
  final Completer<WebViewController> _controller =Completer<WebViewController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white54,
        title: Text("Details",style: TextStyle(color: Colors.black54),),

      ),
      body: Stack(
        children:[
          WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl:widget.articleurl ,

              onWebViewCreated: (WebViewController webViewController){
                _controller.complete(webViewController);
              },
              onPageStarted: (finish){
                setState(() {
                  _isloaded = false;
                });
              },
            ),

          _isloaded ? Center(child: CircularProgressIndicator(
            color: Colors.black54,
            backgroundColor: Colors.white54,
            strokeWidth: 1.5,
          ),):Stack(),
        ]
      ),
    );
  }
}
