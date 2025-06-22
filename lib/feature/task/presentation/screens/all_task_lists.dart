import 'package:flutter/material.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/task/presentation/widgets/task_widget_task_list.dart';

class AllTaskLists extends StatefulWidget {
  const AllTaskLists({super.key});

  @override
  State<AllTaskLists> createState() => _AllTaskListsState();
}

class _AllTaskListsState extends State<AllTaskLists> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: 'All Tasks'.text20Black(),
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  // TaskWidgetTaskList(),
                  // const SizedBox(height: 16.0),
                  // TaskWidgetTaskList(),
                  // const SizedBox(height: 16.0),
                  // TaskWidgetTaskList(),
                  // const SizedBox(height: 16.0),
                  // TaskWidgetTaskList(),
                  // const SizedBox(height: 16.0),
                  // TaskWidgetTaskList(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
