import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pakle/login_page.dart';
import 'package:pakle/sign_up_page.dart';
import 'package:pakle/code_verification_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CodeVerificationPage(),
    );
  }
}
