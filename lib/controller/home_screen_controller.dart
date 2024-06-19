import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class HomeScreenController with ChangeNotifier{
  late News newsModel;
  bool isLoading=false;
  var baseUrl="https://newsapi.org/";
  ///To process api and get response
  fetchData()async {
    isLoading = true;
    final url = "$baseUrl/v2/top-headlines?country=in&apiKey=74fbffea075a48119dadba44b88860e1";
    final response = await http.get(Uri.parse(url));
    print(response.statusCode);
    Map<String, dynamic>decodeData = {};
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
    }
    else{
      print("Api failed");
    }
    newsModel=News.fromJson(decodeData);
    isLoading=false;
    notifyListeners();
  }
}