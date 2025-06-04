import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/others/presentation/widgets/notification_widget.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios),
            ),
            centerTitle: true,
            title: 'Notification'.text20Black(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                'New'.text20Black(),
                const SizedBox(height: 8.0),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
                const SizedBox(height: 32),

                //.......................................................
                'Earlier'.text20Black(),
                const SizedBox(height: 8.0),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
                NotificationWidget(
                  text:
                      'Let’s move! Gym time in 10—grab your gear grab your gear',
                  timeAgo: '02 mins',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
