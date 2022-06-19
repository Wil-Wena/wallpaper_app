import 'package:flutter/material.dart';
import 'pages/HomePage.dart';
import 'pages/ViewPage.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => HomePage(),
      '/view': (context) => ViewPage(),
    },
  ));
}
