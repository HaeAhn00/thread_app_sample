import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:thread_app_sample/home.dart';
import 'package:thread_app_sample/home_feed_list_controller.dart';
import 'package:timeago/timeago.dart' as timeago;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: 'AIzaSyDmhryp9iTeJwZjhSAh7bzad0He7K2lZiI',
      appId: '1:212571027652:android:787cbe219a0a71d3cff191',
      messagingSenderId: '212571027652',
      projectId: 'thread-sample-app-10c88',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance.collection('feeds').get().then((value) {
      print(value.docs.length);
    });
    timeago.setLocaleMessages('ko', timeago.KoMessages());
    Get.put(HomeFeedListcontroller());
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black),
        ),
        useMaterial3: true,
      ),
      home: Home(),
    );
  }
}
