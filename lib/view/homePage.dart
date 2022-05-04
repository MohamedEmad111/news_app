import 'package:flutter/material.dart';
import 'package:flutter_application_14/controller/news_controller.dart';
import 'package:flutter_application_14/model/news_model.dart';
import 'package:flutter_application_14/view/business.dart';
import 'package:flutter_application_14/view/entertainment.dart';
import 'package:flutter_application_14/view/general.dart';
import 'package:flutter_application_14/view/health.dart';
import 'package:flutter_application_14/view/science.dart';
import 'package:flutter_application_14/view/sports.dart';
import 'package:flutter_application_14/view/technical.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class homePage extends StatelessWidget {
  List screens = [science(),health(),sports(),technical(),entertainment(),general(),business()];
  newscontroller controller = Get.put(newscontroller(), permanent: true);
  homePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           
            bottomNavigationBar: GetX<newscontroller>(
                builder: ((controller) => BottomNavigationBar(
                  selectedItemColor: Colors.blue,
                        currentIndex: controller.currentindex.value,
                        onTap: (val) {
                          controller.currentindex.value = val;
                        },
                        items: [
                          BottomNavigationBarItem(
                              icon: Icon(Icons.science), label: 'science'),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.health_and_safety),
                              label: 'health'),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.sports), label: 'sports'),
                          BottomNavigationBarItem(
                              icon: Icon(Icons.smart_button),
                              label: 'technical'), 
                              BottomNavigationBarItem(
                              icon: Icon(Icons.backup_table),
                              label: 'entertainment'), 
                                BottomNavigationBarItem(
                              icon: Icon(Icons.ballot),
                              label: 'general'), 
                               BottomNavigationBarItem(
                              icon: Icon(Icons.business),
                              label: 'business'), 
                                 
                        ]))),
                        body:GetX<newscontroller>
                        (builder: ((controller) => screens[controller.currentindex.value])) ,
                        ));
  }
}
