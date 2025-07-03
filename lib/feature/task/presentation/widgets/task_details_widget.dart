import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/task/presentation/screens/task_details_screen.dart';
import '../../../../core/widgets/default_circular_percent_widget.dart';
import '../../../../core/widgets/linear_percent_bar_widget.dart';

class TaskDetailsWidget extends StatelessWidget {
  final String taskName;
  final String taskDate;
  final String taskStartTime;
  final String taskEndTime;
  final String taskLocation;
  final bool isFullDay;
  final String taskId;

  const TaskDetailsWidget({
    super.key,
    required this.taskName,
    required this.taskDate,
    required this.taskStartTime,
    required this.taskEndTime,
    required this.taskLocation,
    required this.isFullDay,
    required this.taskId,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          TaskDetailsScreen(
            taskName: taskName,
            taskDate: taskDate,
            taskStartTime: taskStartTime,
            taskEndTime: taskEndTime,
            taskLocation: taskLocation,
            isFullDay: isFullDay,
            taskId: taskId,
          ),
        );
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
                taskName.text20Black(),
                Row(
                  children: [
                    Icon(Icons.calendar_month_outlined, color: Colors.black),
                    const SizedBox(width: 8),
                    taskDate.text16Black(),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.alarm, color: Colors.black),
                    const SizedBox(width: 8),
                    '$taskStartTime - $taskEndTime'.text16Black(),
                  ],
                ),
                ('Time Remaining: ${calculateTimeDifference(taskStartTime, taskEndTime)}')
                    .text16Black(),
                LinearPercentBarWidget(percent: 50),
              ],
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularPercentWidget(percent: 50, size: 70),
                const SizedBox(height: 20),
                // NormalCustomButton(
                //   text: 'Edit',
                //   showIcon: true,
                //   sufixIcon: Icons.edit_outlined,
                //   onPressed: () {},
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String calculateTimeDifference(String start, String end) {
  DateTime now = DateTime.now();
  DateTime startTime = DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(start.split(":")[0]),
    int.parse(start.split(":")[1]),
  );
  DateTime endTime = DateTime(
    now.year,
    now.month,
    now.day,
    int.parse(end.split(":")[0]),
    int.parse(end.split(":")[1]),
  );

  Duration diff = endTime.difference(startTime);
  if (diff.isNegative) return "0m";

  return "${diff.inHours}h ${diff.inMinutes.remainder(60)}m";
}
