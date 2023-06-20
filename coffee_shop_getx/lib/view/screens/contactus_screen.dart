import 'package:coffee_shop_get/consts/app_constants.dart';
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
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100,horizontal: 5),
        child: Column(
          children: [
            ...Appconstants.socialist.map((e) =>
            InkWell(
              onTap: () {
                _launched = _launchInWebViewOrVC(
                    Uri.parse(e["url"]!));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      e["name"]??"",
                      style: numberstyle,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(e["img"]!),fit: BoxFit.fill)
                      ),
                    )
                  ],
                ),
              ),
            )

            ).toList()
            /*InkWell(
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
            )*/
          ],
        ),
      ),
    );
  }
}
