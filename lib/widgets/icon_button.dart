import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart ';

class IconBackground extends StatelessWidget {
  late IconData icon;
  late VoidCallback onTap;

  IconBackground({required this.icon, required this.onTap});


  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(13),
      color: Theme.of(context).cardColor,
      child: InkWell(
        borderRadius: BorderRadius.circular(13),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon),
        ),
      ),
    );
  }
}
