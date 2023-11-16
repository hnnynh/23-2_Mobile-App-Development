import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'studentInfo.dart';
import 'numberpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => StudentInfoList(),
      builder: (context, child) => MaterialApp(
        title: "My App",
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: NumberPage(),
      ),
    );
  }
}