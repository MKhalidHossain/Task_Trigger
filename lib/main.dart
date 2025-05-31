import 'package:flutter/material.dart';
import 'package:iwalker/feature/auth/presentation/screens/sign_up.dart';

import 'feature/auth/presentation/screens/change_password.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const ChangePassword(),
    );
  }
}
