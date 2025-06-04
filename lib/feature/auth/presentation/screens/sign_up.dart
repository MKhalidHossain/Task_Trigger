import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/auth/presentation/screens/sign_in.dart';

import '../../../../core/widgets/outlined_text_field_widget.dart';
import '../../../../core/widgets/wide_custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController nameContoller;
  late TextEditingController emailContoller;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    nameContoller = TextEditingController();
    emailContoller = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
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
          body: Column(
            children: [
              const SizedBox(height: 56.0),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // SvgPicture.asset(
                    //   'assets/images/TaskTrigger.svg',
                    //   height: 150,
                    //   width: 150,
                    //   fit: BoxFit.cover,
                    // ),
                    Image.asset(
                      'assets/images/task_trigger.png',
                      fit: BoxFit.cover,
                      height: 150,
                      width: 150,
                    ),

                    const SizedBox(height: 48.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'Create Account'.text24DarkGreen(),
                            const SizedBox(height: 8.0),
                          ],
                        ),
                      ],
                    ),
                    // const SizedBox(height: 8.0),
                    OutlinedTextFieldWidget(
                      //name: 'Username or Email',
                      lebel: 'Name',
                      controller: nameContoller,
                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'Username or Email',
                    ),
                    const SizedBox(height: 12),
                    OutlinedTextFieldWidget(
                      //name: 'Username or Email',
                      lebel: 'Email',
                      controller: emailContoller,
                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'Email',
                    ),
                    const SizedBox(height: 12),
                    OutlinedTextFieldWidget(
                      //name: 'Password',
                      isObsecure: true,
                      lebel: 'Password',
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'password',
                    ),
                    const SizedBox(height: 12),
                    OutlinedTextFieldWidget(
                      //name: 'Password',
                      isObsecure: true,
                      lebel: 'Confirm Password',
                      controller: confirmPasswordController,
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
                      text: 'Sign Up',
                      onPressed: () {
                        String email = emailContoller.text;
                        String password = passwordController.text;
                        if (email.isEmpty) {
                          showAboutDialog(
                            context: context,
                            children: [Text('email is required'.tr)],
                          );
                        } else if (password.isEmpty) {
                          showAboutDialog(
                            context: context,
                            children: [Text('password_is_required'.tr)],
                          );
                        } else if (password.length < 5) {
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     TextButton(
                    //       onPressed: () {
                    //         // Get.to(LostPasswordScreen());
                    //       },
                    //       child: Text(
                    //         'Lost your password?',
                    //         textAlign: TextAlign.center,
                    //         style: TextStyle(color: Colors.grey),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  "Don't have an account?".text16Black(),
                  TextButton(
                    onPressed: () {
                      Get.to(SignIn());
                    },
                    child: 'Sign in'.text16Profile(),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     TextButton(
              //       onPressed: () {
              //         Get.to(HomeScreen());
              //       },
              //       child: Text(
              //         'SKIP',
              //         textAlign: TextAlign.center,
              //         style: TextStyle(color: Colors.red),
              //       ),
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
