import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msg_snd/models/message_data.dart';

class ChatScreen extends StatelessWidget {
  late MessageData messageData;
  ChatScreen({required this.messageData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      child: Center(
        child: Text("Connecting to  ${messageData.senderName}"),
      ),
    ));
  }
}
