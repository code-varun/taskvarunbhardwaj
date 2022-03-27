import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:taskvarunbhardwaj/Widgets/index.dart';
import 'screens/homepage/bindings/index.dart';

// Main app
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialBinding: ControllerBinding(),
        title: 'Flutter Demo',
        themeMode: ThemeMode.system,
        home: SafeArea(
          child: Scaffold(
            bottomNavigationBar: BottomNavBar(),
          ),
        ));
  }
}
