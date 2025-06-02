import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import '../../../../core/widgets/normal_custom_button.dart';
import '../widgets/task_details_widget.dart';

class TaskDetailsScreen extends StatelessWidget {
  const TaskDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        bottom: false,
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
            title: 'Task Details'.text20Black(),
            actions: [
              IconButton(
                icon: const Icon(Icons.more_vert),
                onPressed: () => _showPopupMenuFromTopRight(context),
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  TaskDetailsWidget(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 60.0,
                      vertical: 16,
                    ),
                    child: 'You reached the GYM area '.text24BlackCenter(),
                  ),
                  Container(
                    width: double.infinity,
                    height: 380,
                    decoration: BoxDecoration(
                      color: Color(0xffC5DBDD),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Center(child: const Text('Map')),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

void _showPopupMenuFromTopRight(BuildContext context) {
  showDialog(
    context: context,
    barrierColor: Colors.transparent, // Transparent background
    builder: (BuildContext context) {
      return Stack(
        children: [
          Positioned(
            top: 60,
            right: 16,
            child: Material(
              elevation: 8,
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xffecf3f4),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      NormalCustomButton(
                        weight: 100,
                        text: "Edit",
                        showIcon: true,
                        sufixIcon: Icons.edit_outlined,
                        onPressed: () {
                          Navigator.pop(context);
                          // Add your Edit logic here
                        },
                      ),
                      const SizedBox(height: 8),
                      NormalCustomButton(
                        weight: 100,
                        text: "Delete",
                        showIcon: true,
                        sufixIcon: Icons.delete_outlined,
                        onPressed: () {
                          Navigator.pop(context);
                          // Add your Delete logic here
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    },
  );
}
