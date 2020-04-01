import 'package:flutter/material.dart';
import 'package:multiple_animations/ui/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      title: 'E-Commerce',
      theme: ThemeData(
        primarySwatch: Colors.blue,primaryColor: Color(0xFF5568FF)
      ),
      home: HomePage()
    );
  }
}
