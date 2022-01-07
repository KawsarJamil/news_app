import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:url_launcher/url_launcher.dart';

class details extends StatelessWidget {
  static const String path = "details";
  const details({Key? key}) : super(key: key);

  Future launchUrl(String url) async {
    if (await canLaunch(url)) {
      return url;
    } else {
      return "can't launch";
    }
  }

  @override
  Widget build(BuildContext context) {
    final Map newsData = ModalRoute.of(context)!.settings.arguments as Map;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "News International",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: Icon(
              Icons.notification_important,
              color: Colors.black,
            ),
          ),
        ],
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Text(
              newsData["title"],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 8,
            ),
            Hero(
                tag: "${newsData["url"]}",
                child: Image.network(
                  newsData["urlToImage"],
                  height: 250,
                  width: double.infinity,
                )),
            SizedBox(
              height: 8,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Author: ${newsData["author"]}"),
                Text("Published: ${newsData["publishedAt"]}")
              ],
            ),
            SizedBox(
              height: 16,
            ),
            RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: newsData["description"],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text: "[more details]",
                    style: TextStyle(
                        color: Colors.blue,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        launchUrl(newsData["url"]);
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
