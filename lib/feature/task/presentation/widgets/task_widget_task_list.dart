import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/task/presentation/screens/task_details_screen.dart';

import '../../../../core/widgets/default_circular_percent_widget.dart';
import '../../../../core/widgets/linear_percent_bar_widget.dart';
import '../../../../core/widgets/normal_custom_button.dart';

class TaskWidgetTaskList extends StatelessWidget {
  const TaskWidgetTaskList({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(TaskDetailsScreen());
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 200,
        width: double.infinity,

        decoration: BoxDecoration(
          color: Color(0xffC5DBDD),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                'GYM'.text20Black(),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: Colors.black),
                    const SizedBox(width: 8),
                    '05 JUN 2025'.text16Black(),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.alarm, color: Colors.black),
                    const SizedBox(width: 8),
                    '10:00 AM - 11:00 AM'.text16Black(),
                  ],
                ),
                'Time Remaining'.text16Black(),
                LinearPercentBarWidget(percent: 50),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentWidget(percent: 50, size: 70),
                const SizedBox(height: 20),
                NormalCustomButton(
                  text: 'Edit',
                  showIcon: true,
                  sufixIcon: Icons.edit_outlined,
                  onPressed: () {},
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
