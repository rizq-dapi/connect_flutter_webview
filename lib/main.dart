import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ConnectWebPage(),
    );
  }
}

class ConnectWebPage extends StatefulWidget {
  @override
  _ConnectWebPageState createState() => _ConnectWebPageState();
}

class _ConnectWebPageState extends State<ConnectWebPage> {
  var URL = 'https://connect.dapi.co/v3/connection?'
      'isWebview=true'
      '&isMobile=true'
      '&countries=["AE","EG","JO"]'
      '&showLogo=true'
      '&environment=production'
      '&isExperimental=false'
      '&appKey=1d4592c4a8dd6ff75261e57eb3f80c518d7857d6617769af3f8f04b0590baceb';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Webview App"),
      ),
      body: Container(
        child: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(URL)),
          onWebViewCreated: (InAppWebViewController controller) {},
          onUpdateVisitedHistory:
              (InAppWebViewController controller, Uri url, bool _) {
            String status = url.pathSegments.last;

            if (status == "success") {
              //Connection info
              print(url.queryParameters);
            }

            if (status == "error") {
              //Error info
              print(url.queryParameters);
            }
          },
        ),
      ),
    );
  }
}
