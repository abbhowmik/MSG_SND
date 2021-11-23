import 'package:flutter/material.dart';
import 'package:msg_snd/screens/home_screen.dart';
import 'package:msg_snd/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'msg_snd',
      theme:AppTheme().dark,
      // themeMode: ThemeMode.dark,
      home: const HomeScreen(),
    );
  }
}
