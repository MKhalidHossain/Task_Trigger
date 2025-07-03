import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/core/widgets/wide_custom_button.dart';
import 'package:iwalker/feature/task/controllers/task_controller.dart';
import '../widgets/outlined_text_field_widget.dart';
import 'package:intl/intl.dart';

class CreateNewTaskOrEditTask extends StatefulWidget {
  final bool isEditing;
  final String? taskId;
  final String? existingTaskName;
  final String? existingDate;
  final String? existingStartTime;
  final String? existingEndTime;
  final String? existingLocation;
  final bool? existingIsFullDay;
  CreateNewTaskOrEditTask({
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
  State<CreateNewTaskOrEditTask> createState() =>
      _CreateNewTaskOrEditTaskState();
}

class _CreateNewTaskOrEditTaskState extends State<CreateNewTaskOrEditTask> {
  final TextEditingController tNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController setLocaionController = TextEditingController();

  bool isFullDay = false;
  // Inside your state class
  String _backendDate =
      ''; // add this at the top of your _CreateNewTaskOrEditTaskState class

  @override
  void initState() {
    super.initState();
    if (widget.isEditing) {
      setState(() {
        tNameController.text = widget.existingTaskName ?? '';
        if (widget.existingDate != null && widget.existingDate!.isNotEmpty) {
          try {
            final parsedDate = DateTime.parse(widget.existingDate!);

            // Format 1: "21 June 2025"
            // final formattedDate = DateFormat('d MMMM y').format(parsedDate);

            // Format 2: "21/06/2025"
            final formattedDate = DateFormat('dd/MM/yyyy').format(parsedDate);

            dateController.text = formattedDate;
          } catch (e) {
            dateController.text = widget.existingDate!;
          }
        }

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

                          GestureDetector(
                            onTap: () async {
                              DateTime? pickedDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2020),
                                lastDate: DateTime(2100),
                              );
                              if (pickedDate != null) {
                                // Format date for display (UI)
                                final formattedDate = DateFormat(
                                  'dd/MM/yyyy',
                                ).format(pickedDate);

                                // Format date for backend
                                final backendDate = DateFormat(
                                  'yyyy-MM-dd',
                                ).format(pickedDate);

                                setState(() {
                                  dateController.text = formattedDate;
                                  _backendDate = backendDate;
                                });
                              }
                            },
                            child: AbsorbPointer(
                              child: OutlinedTextFieldforCreateWidget(
                                lebel: 'Select Date',
                                controller: dateController,
                                textInputType: TextInputType.text,
                                icon: Icon(Icons.calendar_month_outlined),
                              ),
                            ),
                          ),

                          // OutlinedTextFieldforCreateWidget(
                          //   //name: 'Password',
                          //   lebel: 'Select Date',
                          //   controller: dateController,
                          //   textInputType: TextInputType.text,
                          //   icon: Icon(Icons.calendar_month_outlined),
                          //   //textFieldHeaderName: 'password',
                          // ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: // Start Time
                                    GestureDetector(
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay(
                                            hour: 00,
                                            minute: 00,
                                          ),
                                          builder: (
                                            BuildContext context,
                                            Widget? child,
                                          ) {
                                            return MediaQuery(
                                              data: MediaQuery.of(
                                                context,
                                              ).copyWith(
                                                alwaysUse24HourFormat: true,
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                    if (pickedTime != null) {
                                      final now = DateTime.now();
                                      final datetime = DateTime(
                                        now.year,
                                        now.month,
                                        now.day,
                                        pickedTime.hour,
                                        pickedTime.minute,
                                      );
                                      final formattedTime = DateFormat(
                                        'HH:mm',
                                      ).format(datetime);
                                      setState(() {
                                        startTimeController.text =
                                            formattedTime;
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: OutlinedTextFieldforCreateWidget(
                                      lebel: 'Start Time',
                                      controller: startTimeController,
                                      textInputType: TextInputType.text,
                                      icon: Icon(Icons.access_time),
                                    ),
                                  ),
                                ),

                                // OutlinedTextFieldforCreateWidget(
                                //   //name: 'Password',
                                //   lebel: 'Start Time',
                                //   controller: startTimeController,
                                //   textInputType: TextInputType.text,
                                //   icon: Icon(Icons.calendar_month_outlined),
                                //   //textFieldHeaderName: 'password',
                                // ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child:
                                // End Time
                                GestureDetector(
                                  onTap: () async {
                                    TimeOfDay? pickedTime =
                                        await showTimePicker(
                                          context: context,
                                          initialTime: TimeOfDay(
                                            hour: 18,
                                            minute: 0,
                                          ),
                                          builder: (
                                            BuildContext context,
                                            Widget? child,
                                          ) {
                                            return MediaQuery(
                                              data: MediaQuery.of(
                                                context,
                                              ).copyWith(
                                                alwaysUse24HourFormat: true,
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                    if (pickedTime != null) {
                                      final now = DateTime.now();
                                      final datetime = DateTime(
                                        now.year,
                                        now.month,
                                        now.day,
                                        pickedTime.hour,
                                        pickedTime.minute,
                                      );
                                      final formattedTime = DateFormat(
                                        'HH:mm',
                                      ).format(datetime);
                                      setState(() {
                                        endTimeController.text = formattedTime;
                                      });
                                    }
                                  },
                                  child: AbsorbPointer(
                                    child: OutlinedTextFieldforCreateWidget(
                                      lebel: 'End Time',
                                      controller: endTimeController,
                                      textInputType: TextInputType.text,
                                      icon: Icon(Icons.access_time),
                                    ),
                                  ),
                                ),

                                // GestureDetector(
                                //   onTap: () async {
                                //     TimeOfDay? pickedTime =
                                //         await showTimePicker(
                                //           context: context,
                                //           initialTime: TimeOfDay(
                                //             hour: 18,
                                //             minute: 0,
                                //           ),
                                //         );
                                //     if (pickedTime != null) {
                                //       setState(() {
                                //         endTimeController.text = pickedTime
                                //             .format(context);
                                //       });
                                //     }
                                //   },
                                //   child: AbsorbPointer(
                                //     child: OutlinedTextFieldforCreateWidget(
                                //       lebel: 'End Time',
                                //       controller: endTimeController,
                                //       textInputType: TextInputType.text,
                                //       icon: Icon(Icons.access_time),
                                //     ),
                                //   ),
                                // ),
                                // OutlinedTextFieldforCreateWidget(
                                //   //name: 'Password',
                                //   lebel: 'End Time',
                                //   controller: endTimeController,
                                //   textInputType: TextInputType.text,
                                //   icon: Icon(Icons.calendar_month_outlined),
                                //   //textFieldHeaderName: 'password',
                                // ),
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
                                    _backendDate,
                                    startTime,
                                    endTime,
                                    setLocaionController.text,
                                    isFullDay,
                                    widget.taskId!,
                                  );
                                } else {
                                  taskController.addTask(
                                    taskName,
                                    _backendDate,
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
