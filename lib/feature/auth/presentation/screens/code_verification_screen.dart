import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/core/widgets/wide_custom_button.dart';
import 'package:iwalker/feature/auth/controllers/auth_controller.dart';
import 'package:iwalker/feature/auth/domain/model/authentication_model.dart';
import 'package:iwalker/feature/auth/presentation/screens/create_new_password.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class CodeVerificationScreen extends StatefulWidget {
  final String email;
  const CodeVerificationScreen({super.key, required this.email});

  @override
  State<CodeVerificationScreen> createState() => _CodeVerificationScreenState();
}

class _CodeVerificationScreenState extends State<CodeVerificationScreen> {
  TextEditingController _otpController = TextEditingController();
  int _resendAfterSeconds = 60;
  Timer? _timer;

  @override
  void initState() {
    startCountdown();
    _otpController = TextEditingController();
    super.initState();
  }

  void startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_resendAfterSeconds > 0) {
        setState(() {
          _resendAfterSeconds--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _otpController.dispose();
    super.dispose();
  }

  String maskEmail(String email) {
    var leftOfAtT = email.split('@')[0];
    leftOfAtT = leftOfAtT.replaceRange(
      1,
      leftOfAtT.length - 1,
      '*' * (leftOfAtT.length - 2),
    );
    return '$leftOfAtT@${email.split('@')[1]}'; // replaceRange(start, end, replacement)
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (authController) {
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Color(0xFF6DC9E7), width: 1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Row(
                          children: [
                            //email circle center icon
                            Container(
                              height: 60,
                              width: 60,
                              decoration: BoxDecoration(
                                color: Color(0xFF438B92),
                                shape: BoxShape.circle,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.email_outlined,
                                  color: Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                'Via Email:'.text16Grey(),
                                maskEmail(widget.email).text20Black(),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(height: 16),
                    const Text(
                      "Please check your Email for a message with your code. Your code is 6 numbers long.",
                      style: TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 32),
                    PinCodeTextField(
                      keyboardType: TextInputType.number,
                      autoDismissKeyboard: true,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(6),
                      ],

                      appContext: context,
                      length: 6,
                      controller: _otpController,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(8),
                        fieldHeight: 60,
                        fieldWidth: 50,
                        inactiveColor: Colors.grey,
                        selectedColor: Colors.teal,
                        activeColor: Colors.teal,
                      ),
                      onChanged: (value) {},
                    ),
                    // const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _resendAfterSeconds > 0
                            ? Text(
                              "Resend code in $_resendAfterSeconds s",
                              style: TextStyle(
                                fontSize: 18,
                                color:
                                    _resendAfterSeconds > 0
                                        ? Colors.grey
                                        : Colors.teal,
                                fontWeight: FontWeight.w500,
                                fontFamily: 'outfit',
                              ),
                            )
                            : TextButton(
                              onPressed: () {
                                _resendAfterSeconds = 60;
                                startCountdown();
                              },
                              child:
                                  "Didn't receive code? Resend"
                                      .text16LightGreen(),
                            ),
                      ],
                    ),
                    const SizedBox(height: 14),
                    WideCustomButton(
                      text: 'Verify',
                      onPressed: () {
                        Get.to(CreateNewPassword());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
