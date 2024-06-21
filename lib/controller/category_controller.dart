import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../model/model.dart';

class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];
  String category = "business";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  late News newsModel;
  bool isLoading = false;

  fetchData() async {
    isLoading = true;
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=74fbffea075a48119dadba44b88860e1");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = News.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}

/*
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import '../model/model.dart';

class CategoryController with ChangeNotifier {
  late News newsModel;
  bool isLoading = false;
  List<String> categoryList = [
    "Business"
        "Entertainment"
        "General"
        "Health"
        "Science"
        "Sports"
        "Technology"
  ];
  String category = "business";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();
    print(category);
    notifyListeners();
  }

  fetchData() async {
    isLoading = true;
    final url = Uri.parse("https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=74fbffea075a48119dadba44b88860e1");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodeData = {};
    if (response.statusCode == 200) {
      decodeData = jsonDecode(response.body);
    } else {
      print("Api Failed");
      newsModel = News.fromJson(decodeData);
      isLoading = false;
      notifyListeners();
    }
  }
}

 */
