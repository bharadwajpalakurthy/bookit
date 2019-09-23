import 'package:bookit/values.dart' as prefix0;
import 'package:flutter/material.dart';
import 'screens/Homepage.dart';
import 'package:flutter/services.dart';
import 'values.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: primaryColor));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: primaryColor,
      ),
      home: MyHomePage(title: 'Cart'),
    );
  }
}

