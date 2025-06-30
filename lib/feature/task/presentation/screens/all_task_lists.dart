import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/task/presentation/widgets/task_widget_task_list.dart';

import '../../controllers/task_controller.dart';

class AllTaskLists extends StatefulWidget {
  const AllTaskLists({super.key});

  @override
  State<AllTaskLists> createState() => _AllTaskListsState();
}

class _AllTaskListsState extends State<AllTaskLists> {
  @override
  void initState() {
    Get.find<TaskController>().getAllTasks();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    
    return GetBuilder<TaskController>(
      builder: (taskController) {
        if (taskController.getAllTasksResponseModel.data!.isEmpty) {
          print('task is empty');
          return Container(
            height: size.height * 0.8,
            width: size.width,
            child: const Center(child: Text('No Task Found')),
          );
        }
        if (taskController.getAllTasksResponseModel.data! == null) {
          print('TAsk is null');
          return Container(
            height: size.height * 0.8,
            width: size.width,
            child: const Center(child: Text('No Task Found')),
          );
        }

        return taskController.getAllTasksIsLoading
            ? const Center(child: CircularProgressIndicator())
            : ColoredBox(
              color: Color(0xff438B92),
              child: SafeArea(
                child: Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    centerTitle: true,
                    title: 'All Tasks'.text20Black(),
                  ),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount:
                              taskController
                                  .getAllTasksResponseModel
                                  .data!
                                  .length,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            var d =
                                taskController
                                    .getAllTasksResponseModel
                                    .data![index];
                            return Padding(
                              padding: const EdgeInsets.only(
                                left: 16.0,
                                right: 16.0,
                                bottom: 16.0,
                              ),
                              child: TaskWidgetTaskList(
                                taskName: d.name!,
                                taskDate: d.date!,
                                taskStartTime: d.startTime!,
                                taskEndTime: d.endTime!,
                                taskId: d.sId!,
                              ),
                            );
                          },
                        ),
                        const SizedBox(height: 16.0),
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
            );
      },
    );
  }
}
