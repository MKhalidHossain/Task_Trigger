import 'package:flutter/material.dart';
import 'package:iwalker/core/themes/text_extensions.dart';
import '../../../../core/widgets/default_circular_percent_widget.dart';
import '../widgets/task_widget_home.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Color(0xff438B92),
      child: SafeArea(
        child: Scaffold(
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 100,
                    width: double.infinity,
                    color: Color(0xffC5DBDD),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(
                            'assets/images/person.png',
                          ),
                        ),

                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    'Mr. User Name'.text16Black(),
                                    'Today, 6 December'.text12Black(),
                                  ],
                                ),
                                Icon(Icons.notifications_active_outlined),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),
                  Container(
                    padding: const EdgeInsets.all(16),
                    height: 150,
                    width: double.infinity,
                    color: Color(0xffC366F75),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            'Today\'s Task'.text24White(),
                            '3/8 Tasks'.text16White(),
                          ],
                        ),
                        CircularPercentWidget(
                          percent: 60,
                          size: 100,
                          fontColor: Colors.white,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16.0),

                  'In Progress'.text20Black(),
                  const SizedBox(height: 16.0),

                  //....................................................when api integration nedd to be raw code here .............................................................
                  TaskWidgetHome(),

                  const SizedBox(height: 16.0),
                  TaskWidgetHome(),
                  const SizedBox(height: 16.0),
                  TaskWidgetHome(),

                  const SizedBox(height: 16.0),
                  TaskWidgetHome(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
