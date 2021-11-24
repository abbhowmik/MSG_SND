import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Notifications"),
      ),
    );
  }
}
