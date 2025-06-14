import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:iwalker/feature/auth/presentation/screens/sign_in_screen.dart';

void main() {
  runApp(GetMaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.red,
        //Color(0xffe3eeef),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          surface: Color(0xffe3eeef),
        ),
      ),
      home: SignInScreen(),

      //SignIn(),.
    );
  }
}





// import 'package:flutter/material.dart';
// import 'package:get/get_navigation/src/root/get_material_app.dart';
// import 'package:iwalker/feature/auth/presentation/screens/sign_in.dart';

// import 'navigation/bottom_nevbar.dart';

// void main() {
//   runApp(
//     GetMaterialApp(
//       debugShowCheckedModeBanner: false,

//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primaryColor: Colors.red,
//         //const Color(0xffe3eeef),
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: Color(0xffe3eeef),
//           surface: Color(0xffe3eeef)
//         ),
//         //colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xffe3eeef),),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(),
//     ),
//   );
// }