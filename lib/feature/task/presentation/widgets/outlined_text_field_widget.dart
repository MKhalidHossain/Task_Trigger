import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import '../../../../core/utils/constants/app_colors.dart';

class OutlinedTextFieldforCreateWidget extends StatelessWidget {
  final TextEditingController controller;
  // final String name;
  final bool isLable;
  final String? lebel;
  final TextInputType textInputType;
  final Icon icon;
  final double width;

  const OutlinedTextFieldforCreateWidget({
    super.key,
    required this.controller,
    this.isLable = true,
    this.lebel,
    required this.textInputType,
    required this.icon,
    this.width = double.infinity,
  });

  //final String textFieldHeaderName;

  @override
  Widget build(BuildContext context) {
    Color textColor = Color(0xff737373);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text(
        //   textFieldHeaderName,
        //   textAlign: TextAlign.start,
        //   style: TextStyle(
        //     color: Colors.grey.shade500,
        //     fontSize: 13,
        //     fontWeight: FontWeight.bold,
        //   ),
        // ),
        SizedBox(height: 8),
        SizedBox(
          height: 60,
          width: width,
          child: TextField(
            controller: controller,
            keyboardType: textInputType,
            style: TextStyle(color: textColor),
            decoration: InputDecoration(
              //labelText: isLable && lebel != null ? lebel : null,
              labelText: lebel,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: textColor,
              ),
              prefixIcon: Padding(
                padding: const EdgeInsets.all(12.0),
                child: icon,
              ),
              border: OutlineInputBorder(),

              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: AppColors.context(context).borderColor,
                  width: 1.5,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
