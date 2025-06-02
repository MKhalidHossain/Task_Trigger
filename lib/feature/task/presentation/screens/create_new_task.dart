import 'package:flutter/material.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/core/widgets/wide_custom_button.dart';
import '../widgets/outlined_text_field_widget.dart';

class CreateNewTask extends StatelessWidget {
  CreateNewTask({super.key});

  final TextEditingController tNameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController setLocaionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 36),
                'Create New Task'.text24DarkGreen(),
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
                    OutlinedTextFieldforCreateWidget(
                      width: size.width / 2 - 24,
                      //name: 'Password',
                      lebel: 'Start Time',
                      controller: startTimeController,
                      textInputType: TextInputType.text,
                      icon: Icon(Icons.calendar_month_outlined),
                      //textFieldHeaderName: 'password',
                    ),
                    OutlinedTextFieldforCreateWidget(
                      width: size.width / 2 - 24,
                      //name: 'Password',
                      lebel: 'End Time',
                      controller: endTimeController,
                      textInputType: TextInputType.text,
                      icon: Icon(Icons.calendar_month_outlined),
                      //textFieldHeaderName: 'password',
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                OutlinedTextFieldforCreateWidget(
                  //name: 'Password',
                  lebel: 'Set Location',
                  controller: setLocaionController,
                  textInputType: TextInputType.text,
                  icon: Icon(Icons.location_on_outlined),
                  //textFieldHeaderName: 'password',
                ),
                const SizedBox(height: 12),
                WideCustomButton(text: 'Set Task', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
