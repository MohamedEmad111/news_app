import 'package:flutter/material.dart';
import 'package:flutter_application_14/controller/news_controller.dart';
import 'package:flutter_application_14/model/news_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class sports extends StatelessWidget {
  newscontroller controller = Get.put(newscontroller(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
           
           
            body: FutureBuilder(
              future: controller.getdata('sports'),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                Articles data = snapshot.data;
                if (snapshot.hasData) {
                  return ListView.builder(
                    itemCount: data.articles.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        elevation: 10,
                        shadowColor: Colors.black,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        child: Column(
                          children: [
                           ClipRRect(
                             borderRadius: BorderRadius.circular(40),
                             child:  Image.network(
                                data.articles[index].urlToImage.toString(),),
                           ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              data.articles[index].title ?? 'false news',
                              textDirection: TextDirection.rtl,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(data.articles[index].description ?? 'false',
                            textDirection: TextDirection.rtl,
                            style: TextStyle(color: Colors.white60),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                } else{ 
                return  Center(child: CircularProgressIndicator());
                }
              },
            )));
  }
}
