import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Pages/signIn.dart';
import 'bottomNavigationBar.dart';
import 'Pages/homePage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();

  var username = prefs.getString('username');
  var password = prefs.getString('password');

  runApp(MyApp(isLoggedIn: (username != null && password != null)));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: isLoggedIn ? const BotomNavigationBar() : const Signin_page(),
      // home: BotomNavigationBar(),
    );
  }
}
