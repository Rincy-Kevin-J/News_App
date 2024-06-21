import 'dart:convert';
import 'package:share/share.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeScreenController with ChangeNotifier {
  late News newsModel;
  bool isLoading = false;
  var baseUrl = "https://newsapi.org/";

  ///To process api and get response
  fetchData() async {
    isLoading = true;
    final url =
        "$baseUrl/v2/top-headlines?country=in&apiKey=74fbffea075a48119dadba44b88860e1";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    Map<String, dynamic> decodeData = {};
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = News.fromJson(decodeData);
    isLoading = false;
    notifyListeners();
  }

  ///function to launch a url
  Future<void> launchURL(String url) async {
    final Uri url1 = Uri.parse(url);
    try {
      if (!await launchUrl(url1, mode: LaunchMode.inAppWebView)) {
        await launchUrl(url1, mode: LaunchMode.inAppWebView);
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
    notifyListeners();
  }

  ///to share news
  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
    notifyListeners();
  }
}
