import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterbookstore/view/main_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
    statusBarIconBrightness: Brightness.dark, // status bar icons' color
    systemNavigationBarIconBrightness:
        Brightness.dark, //navigation bar icons' color
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    /*FlutterStatusbarcolor.setStatusBarColor(Colors.white);*/
    return MaterialApp(
      title: 'Flutter bookstore',
      home: MainPages(),
      debugShowCheckedModeBanner: false,
    );
  }
}