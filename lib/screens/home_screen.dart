import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:msg_snd/pages/calls_page.dart';
import 'package:msg_snd/pages/contact_page.dart';
import 'package:msg_snd/pages/messages_page.dart';
import 'package:msg_snd/pages/notification_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final pages = const [
    MessagesPage(),
    NotificationPage(),
    CallsPage(),
    ContactPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:pages[0],
      bottomNavigationBar: _bottomNavigationBar(),
    );
  }
}

class _bottomNavigationBar extends StatefulWidget {
  const _bottomNavigationBar({Key? key}) : super(key: key);

  @override
  _bottomNavigationBarState createState() => _bottomNavigationBarState();
}

class _bottomNavigationBarState extends State<_bottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: true,
        child:Container(
          decoration: BoxDecoration(color: Colors.black87.withOpacity(0.5),
            borderRadius: BorderRadius.circular(22)
          ),
          margin: EdgeInsets.only(bottom: 19, left: 15, right: 15),
          padding: EdgeInsets.all(6),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
            NavigationBarItem(label: "Messaging",icon: CupertinoIcons.bubble_left_bubble_right_fill,),
            NavigationBarItem(label: "Notification",icon: CupertinoIcons.bell_solid),
            NavigationBarItem(label: "Contacts",icon: CupertinoIcons.person_2_fill),
            NavigationBarItem(label: "Calls",icon: CupertinoIcons.phone_fill),
      ],
    ),
        ) );
  }
}

class NavigationBarItem extends StatelessWidget {
  late String label;
  late IconData icon;
  NavigationBarItem({required this.label, required this.icon});



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon),
        SizedBox(height: 5,),
        Text(label, style: TextStyle(fontSize: 12),),
      ],
    );
  }
}

