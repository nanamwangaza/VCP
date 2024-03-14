import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vehicle_campro/pages/landing_page.dart';
import 'package:vehicle_campro/pages/language_page.dart';
import 'package:vehicle_campro/pages/login_page.dart';
import 'package:vehicle_campro/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
      ),
       home: const LandingPage(),
       initialRoute:Routes.initial,
       getPages: Routes.routes,
    );
  }
}

