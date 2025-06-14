import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/core/widgets/wide_custom_button.dart';

import '../../../../core/widgets/outlined_text_field_widget.dart';
import 'code_verification_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
   ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  late TextEditingController emailContoller;

 @override
  void initState() {
  emailContoller = TextEditingController();
    super.initState();
  }




  @override
  void dispose() {
    emailContoller.dispose();
    super.dispose();
  }

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
            title: 'Forgot Password'.text24DarkGreen(),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                'Select which contact details should we use to reset your password'
                    .text14Grey(),
                const SizedBox(height: 32),
                //email container for forgot password email show with secure text
                OutlinedTextFieldWidget(
                      //name: 'Username or Email',
                      lebel: 'Eamil',
                      controller: emailContoller,
                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'Username or Email',
                    ),
                const SizedBox(height: 24),
                WideCustomButton(
                  text: 'Continue',
                  onPressed: () {
                    Get.to(CodeVerificationScreen(email: 'dfgsdfrg@gml.com',));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
