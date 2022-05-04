import 'dart:convert';

import 'package:flutter_application_14/model/news_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class newscontroller extends GetxController {
  RxInt currentindex = 0.obs;
  getdata(String category) async {
    var url = Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=eg&category=${category}&apiKey=373f0a14e0f14a88a3c32d1ffe6d521f');

    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      try {
        return Articles.fromJson(jsonDecode(response.body));
      } catch (e) {
        Get.snackbar('error', e.toString());
      }
    }
  }
}
