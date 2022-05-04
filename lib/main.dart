import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_application_14/view/homePage.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

void main() {
  RenderErrorBox.backgroundColor = Colors.black;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fancy Dialog Example',
      theme: ThemeData.dark(),
      home: homePage(),
    );
  }
}
