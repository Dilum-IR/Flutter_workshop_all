import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Pages/signIn.dart';
import 'bottomNavigationBar.dart';
import 'Pages/homePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        home: Signin_page() //BotomNavigationBar(),
        // home: BotomNavigationBar(),
        );
  }
}
