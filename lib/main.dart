import 'dart:async';
import 'package:bs_tek/BottomNavigation.dart';
import 'package:bs_tek/splashScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'Appointment.dart';
import 'Wrapper.dart';
import 'login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: FirebaseOptions(
          apiKey: "AIzaSyA8e8zmcyZrlCAiESV3M99cWCLeoUfULxo",
          messagingSenderId: "1092798171686",
          projectId: "login-1bf1b",
          appId: "1:1092798171686:web:575fbaef7ead9f728774e7"
      )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        EasyLoading.init()(context, child),
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        ],
        background: Container(color: Color(0xFFF5F5F5)),
      ),
      initialRoute: "/",
      title: "BS Tek",
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
