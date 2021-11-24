import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msg_snd/screens/home_screen.dart';
import 'package:msg_snd/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    final brightness = Theme.of(context).brightness;
    setState(() {
      brightness == Brightness.light
          ? SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
              ),
            )
          : SystemChrome.setSystemUIOverlayStyle(
              SystemUiOverlayStyle(
                statusBarColor: Colors.black,
              ),
            );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'msg_snd',
      theme: AppTheme().light,
      darkTheme: AppTheme().dark,
      themeMode: MyTheme().currentTheme(),
      home: const HomeScreen(),
    );
  }
}
