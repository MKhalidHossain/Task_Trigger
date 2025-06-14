import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';

import '../../../../core/widgets/outlined_text_field_widget.dart';
import '../../../../core/widgets/wide_custom_button.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({super.key});

  @override
  State<CreateNewPassword> createState() => _CreateNewPasswordState();
}

class _CreateNewPasswordState extends State<CreateNewPassword> {
  @override
  // late Authenticaion authenticaion;
  bool isRemember = false;

  //late TextEditingController currentPasswordContoller;
  late TextEditingController newPasswordController;
  late TextEditingController confirmNewPasswordController;

  @override
  void initState() {
    newPasswordController = TextEditingController();
    confirmNewPasswordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        // top: true,
        // bottom: false,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: 'Change Password'.text20Black(),
            leading: IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios),
            ),
            actions: [SizedBox()],
          ),

          body: Column(
            children: [
              const SizedBox(height: 8.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 48.0),

                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.start,
                    //   children: [
                    //     Column(
                    //       crossAxisAlignment: CrossAxisAlignment.center,
                    //       children: [
                    //         'Change Password'.text24DarkGreen(),
                    //         const SizedBox(height: 8.0),
                    //       ],
                    //     ),
                    //   ],
                    // ),
                    // const SizedBox(height: 8.0),
                    // const SizedBox(height: 12),
                    // OutlinedTextFieldWidget(
                    //   //name: 'Username or Email',
                    //   lebel: 'Current Password',
                    //   controller: currentPasswordContoller,
                    //   textInputType: TextInputType.text,
                    //   //textFieldHeaderName: 'Email',
                    // ),
                    const SizedBox(height: 12),
                    OutlinedTextFieldWidget(
                      isObsecure: true,
                      //name: 'Password',
                      lebel: 'New Password',
                      controller: newPasswordController,
                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'password',
                    ),
                    const SizedBox(height: 12),
                    OutlinedTextFieldWidget(
                      isObsecure: true,
                      //name: 'Password',
                      lebel: 'Repeat New Password',
                      controller: confirmNewPasswordController,
                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'Confirm Password',
                    ),
                    // const SizedBox(height: 30),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.end,
                    //   children: ['Forgot Password'.text16LightGreen()],
                    // ),
                    const SizedBox(height: 20.0),

                    WideCustomButton(
                      text: 'Continue',
                      onPressed: () {
                        //  String currentPassword = currentPasswordContoller.text;
                        String newPassword = newPasswordController.text;
                        String confirmNewPassword =
                            confirmNewPasswordController.text;
                        if (newPassword.isEmpty && confirmNewPassword.isEmpty) {
                          showAboutDialog(
                            context: context,
                            children: [
                              Text(
                                'Please Enter a Strong Password contains leters and numbers and special carecters'
                                    .tr,
                              ),
                            ],
                          );
                        } else if (newPassword.length < 8 &&
                            (confirmNewPassword.length < 8)) {
                          showAboutDialog(
                            context: context,
                            children: [Text('minimum password length is 8')],
                          );
                        } else {
                          // authController.SignIn(email, password);
                        }
                      },
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     "Don't have an account?".text16Black(),
              //     TextButton(
              //       onPressed: () {
              //         Get.to(SignIn());
              //       },
              //       child: 'Sign in'.text16LightGreen(),
              //     ),
              //   ],
              // ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
