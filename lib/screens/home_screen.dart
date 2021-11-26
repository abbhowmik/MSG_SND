import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:msg_snd/helpers.dart';
import 'package:msg_snd/pages/calls_page.dart';
import 'package:msg_snd/pages/contact_page.dart';
import 'package:msg_snd/pages/messages_page.dart';
import 'package:msg_snd/pages/notification_page.dart';
import 'package:msg_snd/theme.dart';
import 'package:msg_snd/widgets/avatar.dart';
import 'package:msg_snd/widgets/glowing_button.dart';
import 'package:msg_snd/widgets/icon_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final pages = const [
    MessagesPage(),
    NotificationPage(),
    ContactPage(),
    CallsPage(),
  ];
  final ValueNotifier<int> pageIndex = ValueNotifier(0);
  final ValueNotifier<String> pageTitle = ValueNotifier("Messages");
  final pageNames = ["Messages", "Notificaton", "Contacts", "Calls"];
  bool isLight = true;
  final ValueNotifier<ThemeMode> _notifier = ValueNotifier(ThemeMode.light);

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: ValueListenableBuilder(
          valueListenable: pageTitle,
          builder: (context, String val, _) {
            return Text(val);
          },
        ),
        leading: Row(
          children: [
            SizedBox(width: 14),
            Center(
              child: IconBackground(
                icon: Icons.search,
                onTap: () {
                  print("Search");
                },
              ),
            ),
          ],
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 9),
            child: AvatarImg.small(url: Helpers.getRandomURL()),
          ),
          IconButton(
              onPressed: () {
                MyTheme().switchTheme();
                setState(() {
                  isLight = !isLight;
                });
              },
              icon: Icon(isLight
                  ? Icons.dark_mode_outlined
                  : Icons.light_mode_outlined)),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: pageIndex,
        builder: (context, int value, _) {
          return pages[value];
        },
      ),
      bottomNavigationBar: _BottomNavigationBar(
        onItemSelected: (i) {
          print("this is $i");
          pageTitle.value = pageNames[i];
          pageIndex.value = i;
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatefulWidget {
  late ValueChanged<int> onItemSelected;

  _BottomNavigationBar({required this.onItemSelected});

  @override
  State<_BottomNavigationBar> createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<_BottomNavigationBar> {
  var selectedIdx = 0;

  void handleSelected(int index) {
    setState(() {
      selectedIdx = index;
    });
    widget.onItemSelected(index);
  }

  @override
  Widget build(BuildContext context) {
    final brightness = Theme.of(context).brightness;
    return Card(
      color: brightness == Brightness.light ? Colors.transparent : null,
      elevation: 0,
      child: SafeArea(
          top: false,
          bottom: true,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 16, left: 5, right: 5, bottom: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    NavigationBarItem(
                      index: 0,
                      onTap: handleSelected,
                      isSelected: (selectedIdx == 0),
                      label: "Message",
                      icon: CupertinoIcons.bubble_left_bubble_right_fill,
                    ),
                    NavigationBarItem(
                        index: 1,
                        onTap: handleSelected,
                        isSelected: (selectedIdx == 1),
                        label: "Notification",
                        icon: CupertinoIcons.bell_solid),
                    Container(
                      margin: EdgeInsets.only(left: 3, right: 3, bottom: 3),
                      child: GlowingActionButton(
                          icon: CupertinoIcons.plus,
                          color: Colors.blue,
                          size: 53,
                          onPressed: () {}),
                    ),
                    NavigationBarItem(
                        index: 2,
                        onTap: handleSelected,
                        isSelected: (selectedIdx == 2),
                        label: "Contacts",
                        icon: CupertinoIcons.person_2_fill),
                    NavigationBarItem(
                        index: 3,
                        onTap: handleSelected,
                        isSelected: (selectedIdx == 3),
                        label: "Calls",
                        icon: CupertinoIcons.phone_fill),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  late String label;
  late IconData icon;
  late int index;
  late bool isSelected;
  late ValueChanged<int> onTap;

  NavigationBarItem(
      {required this.index,
      this.isSelected = false,
      required this.onTap,
      required this.label,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        onTap(index);
      },
      child: SizedBox(
        height: 50,
        width: 70,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              size: 20,
              color: isSelected ? AppColors.secondary : null,
            ),
            SizedBox(
              height: 4,
            ),
            Text(
              label,
              style: TextStyle(
                  fontSize: 9, color: isSelected ? AppColors.secondary : null),
            ),
          ],
        ),
      ),
    );
  }
}
