import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
import 'package:msg_snd/helpers.dart';
import 'package:msg_snd/models/message_data.dart';
import 'package:msg_snd/models/story_data.dart';
import 'package:msg_snd/theme.dart';
import 'package:msg_snd/widgets/avatar.dart';

class MessagesPage extends StatefulWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  _MessagesPageState createState() => _MessagesPageState();
}

class _MessagesPageState extends State<MessagesPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverToBoxAdapter(
          child: Stories(),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(_delegate),
        ),
      ],
    );
  }

  Widget _delegate(BuildContext context, int index) {
    final faker = Faker();
    final date = Helpers.getRandomDate();
    return MessageTile(
        messageData: MessageData(
      senderName: faker.person.name(),
      message: faker.lorem.sentence(),
      profilePicture: Helpers.getRandomURL(),
      messageDate: date,
      dateMessege: Jiffy(date).fromNow(),
    ));
  }
}

class Stories extends StatelessWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 133,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 4.0, left: 7),
                child: Text(
                  "Stories",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: AppColors.textFaded),
                ),
              ),
              SizedBox(
                height: 4,
              ),
              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: ClampingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 13,
                    itemBuilder: (BuildContext context, int index) {
                      final faker = Faker();
                      return _StoryCard(
                          storyData: StoryData(
                              name: faker.person.name(),
                              url: Helpers.getRandomURL()));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _StoryCard extends StatelessWidget {
  late StoryData storyData;
  _StoryCard({required this.storyData});

  String trimName(String name) {
    String dup = "";
    for (int i = 0; i < name.length; i++) {
      if (name[i] == ' ') {
        break;
      } else {
        dup += name[i];
      }
    }
    return dup;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 29.0, top: 13),
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AvatarImg(url: storyData.url, radious: 23),
            SizedBox(
              height: 5,
            ),
            Expanded(
                child: Text(
              trimName(storyData.name),
              style: TextStyle(fontSize: 14),
            )),
          ],
        ),
      ),
    );
  }
}

class MessageTile extends StatelessWidget {
  late MessageData messageData;
  MessageTile({required this.messageData});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 7.0),
      child: Container(
        height: 70,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: AvatarImg(url: Helpers.getRandomURL(), radious: 30),
            ),
            SizedBox(
              width: 4,
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        messageData.senderName,
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 15,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        messageData.message,
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 13.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 9,
                  ),
                  Text(
                    messageData.dateMessege.toUpperCase(),
                    style: TextStyle(
                        fontSize: 13,
                        letterSpacing: -0.2,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textFaded),
                  ),
                  SizedBox(
                    height: 7,
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 23,
                    width: 23,
                    decoration: BoxDecoration(
                      color: AppColors.secondary,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      "2",
                      style:
                          TextStyle(fontSize: 10, color: AppColors.textLight),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
