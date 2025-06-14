import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';

class CodeVerifyScreen extends StatelessWidget {
  const CodeVerifyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios, color: Color(0xFF1E3F42)),
            ),
            centerTitle: true,
            title: 'Enter Security Code'.text24DarkGreen(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                'Select which contact details should we use to reset your password'
                    .text14Grey(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
