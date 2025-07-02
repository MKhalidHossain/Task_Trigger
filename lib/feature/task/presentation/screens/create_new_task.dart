import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/core/widgets/wide_custom_button.dart';
import 'package:iwalker/feature/task/controllers/task_controller.dart';
import '../widgets/outlined_text_field_widget.dart';

class CreateNewTask extends StatefulWidget {
  final bool isEditing;
  final String? taskId;
  final String? existingTaskName;
  final String? existingDate;
  final String? existingStartTime;
  final String? existingEndTime;
  final String? existingLocation;
  final bool? existingIsFullDay;
  CreateNewTask({
    super.key,
    this.isEditing = false,
    this.taskId,
    this.existingTaskName,
    this.existingDate,
    this.existingStartTime,
    this.existingEndTime,
    this.existingLocation,
    this.existingIsFullDay,
  });

  @override
  State<CreateNewTask> createState() => _CreateNewTaskState();
}

class _CreateNewTaskState extends State<CreateNewTask> {
  final TextEditingController tNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController setLocaionController = TextEditingController();

  bool isFullDay = false;

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      setState(() {
        tNameController.text = widget.existingTaskName ?? '';
        dateController.text = widget.existingDate ?? '';
        startTimeController.text = widget.existingStartTime ?? '';
        endTimeController.text = widget.existingEndTime ?? '';
        setLocaionController.text = widget.existingLocation ?? '';
        isFullDay = widget.existingIsFullDay ?? false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<TaskController>(
      builder: (taskController) {
        return taskController.addTaskIsLoading
            ? const Center(child: CircularProgressIndicator())
            : ColoredBox(
              color: Color(0xff438B92),
              child: SafeArea(
                child: Scaffold(
                  //.......................................... Need to Remove this > Appbar < When App APi integrated.......................................
                  // appBar: AppBar(
                  //   leading: IconButton(
                  //     icon: const Icon(Icons.arrow_back_ios),
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  body: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 36),
                          (widget.isEditing ? 'Edit Task' : 'Create New Task')
                              .text24DarkGreen(),
                          const SizedBox(height: 12),
                          OutlinedTextFieldforCreateWidget(
                            //name: 'Password',
                            lebel: 'Task Name',
                            controller: tNameController,
                            textInputType: TextInputType.text,
                            icon: Icon(Icons.insert_drive_file_outlined),
                            //textFieldHeaderName: 'password',
                          ),
                          const SizedBox(height: 4),
                          OutlinedTextFieldforCreateWidget(
                            //name: 'Password',
                            lebel: 'Select Date',
                            controller: dateController,
                            textInputType: TextInputType.text,
                            icon: Icon(Icons.calendar_month_outlined),
                            //textFieldHeaderName: 'password',
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: OutlinedTextFieldforCreateWidget(
                                  //name: 'Password',
                                  lebel: 'Start Time',
                                  controller: startTimeController,
                                  textInputType: TextInputType.text,
                                  icon: Icon(Icons.calendar_month_outlined),
                                  //textFieldHeaderName: 'password',
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: OutlinedTextFieldforCreateWidget(
                                  //name: 'Password',
                                  lebel: 'End Time',
                                  controller: endTimeController,
                                  textInputType: TextInputType.text,
                                  icon: Icon(Icons.calendar_month_outlined),
                                  //textFieldHeaderName: 'password',
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          WideCustomButton(
                            text:
                                isFullDay ? 'Assigned' : 'Assign For Full Day',
                            onPressed: () {
                              setState(() {
                                isFullDay = !isFullDay;
                              });
                            },
                          ),
                          const SizedBox(height: 12),
                          OutlinedTextFieldforCreateWidget(
                            //name: 'Password',
                            lebel: 'Set Location',
                            controller: setLocaionController,
                            textInputType: TextInputType.text,
                            icon: Icon(Icons.location_on_outlined),
                            //textFieldHeaderName: 'password',
                          ),
                          const SizedBox(height: 12),
                          WideCustomButton(
                            text: widget.isEditing ? 'Update Task' : 'Set Task',
                            onPressed: () {
                              String taskName = tNameController.text;
                              String date = dateController.text;
                              String startTime = startTimeController.text;
                              String endTime = endTimeController.text;

                              if (taskName.isEmpty) {
                                showAboutDialog(
                                  context: context,
                                  children: [Text('Task name is required'.tr)],
                                );
                              } else if (date.isEmpty) {
                                showAboutDialog(
                                  context: context,
                                  children: [Text('Date is required'.tr)],
                                );
                              }
                              //  else if (name.isEmpty ||
                              //     email.isEmpty ||
                              //     password.isEmpty ||
                              //     confirmPassword.isEmpty) {
                              //   showAboutDialog(
                              //     context: context,
                              //     children: [
                              //       Text("All fields are required".tr),
                              //     ],
                              //   );
                              // }
                              else if (startTime.isEmpty || endTime.isEmpty) {
                                showAboutDialog(
                                  context: context,
                                  children: [
                                    Text('Start and end time is required'.tr),
                                  ],
                                );
                              } else if (endTime == startTime) {
                                showAboutDialog(
                                  context: context,
                                  children: [
                                    Text('Start and end time does not same'.tr),
                                  ],
                                );
                              } else {
                                if (widget.isEditing) {
                                  taskController.editTask(
                                    taskName,
                                    date,
                                    startTime,
                                    endTime,
                                    setLocaionController.text,
                                    isFullDay,
                                    widget.taskId!,
                                  );
                                } else {
                                  taskController.addTask(
                                    taskName,
                                    date,
                                    startTime,
                                    endTime,
                                    setLocaionController.text,
                                    isFullDay,
                                  );
                                }

                                // taskController.addTask(
                                //   taskName,
                                //   date,
                                //   startTime,
                                //   endTime,
                                //   setLocaionController.text,
                                //   isFullDay,
                                // );
                              }
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
      },
    );
  }
}
