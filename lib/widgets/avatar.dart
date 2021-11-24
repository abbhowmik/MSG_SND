import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class AvatarImg extends StatelessWidget {
  late String url;
  late double radious;
  AvatarImg({required this.url, required this.radious});
  AvatarImg.small({required this.url, this.radious = 19});
  AvatarImg.medium({required this.url, this.radious = 22});
  AvatarImg.large({required this.url, this.radious = 44});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radious,
      backgroundImage: CachedNetworkImageProvider(url),
      backgroundColor: Theme.of(context).cardColor,
    );
  }
}
