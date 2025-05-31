import 'package:flutter/material.dart';

import '../utils/constants/app_colors.dart';

class OutlinedTextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  // final String name;
  final bool isLable;
  final String? lebel;
  final TextInputType textInputType;
  //final String textFieldHeaderName;

  const OutlinedTextFieldWidget({
    super.key,
    required this.controller,
    //required this.name,
    this.isLable = false,
    this.lebel,
    required this.textInputType,
    // required this.textFieldHeaderName,
  });

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
