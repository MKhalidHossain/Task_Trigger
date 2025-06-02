import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/auth/presentation/screens/change_password.dart';
import 'package:iwalker/feature/auth/presentation/screens/sign_up.dart';
import '../../../../app.dart';
import '../../../../core/widgets/outlined_text_field_widget.dart';
import '../../../../core/widgets/wide_custom_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // late Authenticaion authenticaion;

  bool isRemember = false;

  late TextEditingController emailContoller;
  late TextEditingController passwordController;

  @override
  void initState() {
    emailContoller = TextEditingController();
    passwordController = TextEditingController();
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

                    const SizedBox(height: 32.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            'SignIn'.text24DarkGreen(),
                            const SizedBox(height: 8.0),
                            'Please sign in to continue.'.text16Grey(),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8.0),
                    OutlinedTextFieldWidget(
                      //name: 'Username or Email',
                      lebel: 'Eamil',
                      controller: emailContoller,

                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'Username or Email',
                    ),
                    const SizedBox(height: 24),
                    OutlinedTextFieldWidget(
                      //name: 'Password',
                      lebel: 'Password',
                      controller: passwordController,
                      textInputType: TextInputType.text,
                      //textFieldHeaderName: 'password',
                    ),
                    const SizedBox(height: 10),
                    TextButton(
                      onPressed: () {
                        Get.to(const ChangePassword());
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: ['Forgot Password?'.text16LightGreen()],
                      ),
                    ),
                    const SizedBox(height: 10),

                    // const SizedBox(height: 20.0),
                    WideCustomButton(
                      text: 'LOG IN',
                      onPressed: () {
                        Get.to(AppMain());
                        // String email = emailContoller.text;
                        // String password = passwordController.text;
                        // if (email.isEmpty) {
                        //   showAboutDialog(
                        //     context: context,
                        //     children: [Text('email is required'.tr)],
                        //   );
                        // } else if (password.isEmpty) {
                        //   showAboutDialog(
                        //     context: context,
                        //     children: [Text('password_is_required'.tr)],
                        //   );
                        // } else if (password.length < 5) {
                        //   showAboutDialog(
                        //     context: context,
                        //     children: [Text('minimum password length is 8')],
                        //   );
                        // } else {
                        //   // authController.SignIn(email, password);
                        // }
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
                      Get.to(SignUp());
                      // Get.to(() => SignUp());
                    },
                    child: ' SignUp!'.text16LightGreen(),
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
