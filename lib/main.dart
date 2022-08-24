import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:todoex/view/modules/post/post.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'postExample',
        theme: ThemeData(appBarTheme: const AppBarTheme(backgroundColor: Colors.white)),
        home: Post());
  }
}
