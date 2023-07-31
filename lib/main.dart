import 'package:flutter_application/screen/auth/login.dart';
import 'package:flutter_application/common/app_theme.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightAppTheme,
      debugShowCheckedModeBanner: false,
      home: const LoginScreen(),
    );
  }
}
