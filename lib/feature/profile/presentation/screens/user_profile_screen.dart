import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import 'package:iwalker/feature/auth/presentation/screens/sign_in.dart';
import 'package:iwalker/feature/others/presentation/screens/about_app_screen.dart';
import 'package:iwalker/feature/others/presentation/screens/tearm_and_conditon_screen.dart';
import 'package:iwalker/feature/profile/presentation/screens/edit_profile_screen.dart';

import '../../../auth/presentation/screens/change_password.dart';
import '../../../others/presentation/screens/notification_screen.dart';
import '../../../others/presentation/screens/privacy_policy_screen.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xFF438B92),
      child: SafeArea(
        child: Scaffold(
          //backgroundColor: Color(0xffB0E0CF), // light gray-blue background
          body: Stack(
            children: [
              // Top background image
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 4,
                        offset: Offset(0.0, 25.0),
                      ),
                    ],
                  ),
                  child: Image.asset(
                    'assets/images/bg.png', // path to your image
                    fit: BoxFit.cover,
                    width: double.infinity,
                    height: 145, // adjust height as needed
                  ),
                ),
              ),

              // Page content
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // App bar title
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 16),
                      child: 'My Profile'.text20Black(),
                    ),
                  ),

                  // Profile Section
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/person.png',
                          ), // Your profile image
                        ),
                        SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Mr. User Name".text24Black(),
                            SizedBox(height: 4),
                            "Today, 6 December".text16Grey(),
                          ],
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            Get.to(EditProfile());
                          },
                          child: Image.asset(
                            'assets/icons/edit.png',
                            height: 70,
                            width: 70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView(
                        children: [
                          SizedBox(height: 30),
                          _buildMenuItem(
                            Icons.info_outline,
                            "About App",
                            onTap: () {
                              Get.to(AboutAppScreen());
                            },
                          ),
                          _divider(),
                          _buildMenuItem(
                            Icons.privacy_tip_outlined,
                            "Privacy Policy",
                            onTap: () {
                              Get.to(PrivacyPolicyScreen());
                            },
                          ),
                          _divider(),
                          _buildMenuItem(
                            Icons.article_outlined,
                            "Term & Condition",
                            onTap: () {
                              Get.to(TearmAndConditonScreen());
                            },
                          ),
                          _divider(),
                          _buildMenuItem(
                            Icons.lock_outline,
                            "Change Password",
                            onTap: () {
                              Get.to(ChangePassword());
                            },
                          ),
                          _divider(),
                          _buildMenuItem(
                            Icons.lock_outline,
                            "Notification",
                            onTap: () {
                              Get.to(NotificationScreen());
                            },
                          ),
                          _divider(),
                          _buildMenuItem(
                            Icons.logout,
                            "Log Out",
                            color: Colors.red,
                            onTap: () {
                              Get.to(SignIn());
                            },
                          ),
                          _divider(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title, {
    Color color = const Color(0xFF438B92),
    required VoidCallback onTap,

    //VoidCallback   onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(color: color, fontSize: 16, fontFamily: 'outfit'),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: color),
      onTap: onTap, // Handle navigation here
    );
  }

  Widget _divider({Color color = const Color(0xFF438B92)}) {
    return Divider(
      height: 1,
      indent: 20,
      endIndent: 20,
      thickness: 0.5,
      color: color,
    );
  }
}
