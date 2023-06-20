import 'package:coffee_shop_get/consts/global_constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  ContactUsScreen({Key? key}) : super(key: key);
  Future<void>? _launched;

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: homescafold_color,
      body: Center(
        child: Container(
          child: Column(
            children: [
              InkWell(
                onTap: () {
                  _launched = _launchInWebViewOrVC(
                      Uri.parse("https://www.facebook.com/"));
                },
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/social/face.png"))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
