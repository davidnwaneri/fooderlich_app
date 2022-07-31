import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatelessWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('github.com/davidnwaneri'),
      ),
      body: const WebView(
        initialUrl: 'https://github.com/davidnwaneri',
      ),
    );
  }
}