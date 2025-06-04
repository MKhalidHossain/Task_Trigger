import 'package:flutter/material.dart';
import 'package:iwalker/core/themes/text_extensions.dart';

class NotificationWidget extends StatelessWidget {
  final String text;
  final String timeAgo;

  const NotificationWidget({
    super.key,
    required this.text,
    required this.timeAgo,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(height: 8.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(flex: 6, child: '$text'.text16DarkGrey()),
                Expanded(flex: 1, child: '  $timeAgo'.text10DarkGrey()),
              ],
            ),
            const SizedBox(height: 8.0),
            Divider(height: 1),
          ],
        ),
      ],
    );
  }
}
