import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class SearchScreenController with ChangeNotifier {
  News? newsModel;
  bool isLoading = false;

  Future<void> searchData({required String searchText}) async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&sortBy=popularity&apiKey=74fbffea075a48119dadba44b88860e1");
    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        final Map<String, dynamic> decodedData = jsonDecode(response.body);
        newsModel = News.fromJson(decodedData);
      } else {
        print("Api failed"); // Handle the failure case as needed.
      }
    } catch (e) {
      print("Error: $e"); // Handle the error case as needed.
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
