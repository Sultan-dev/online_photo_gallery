import 'package:challengeday1/screens/account_screen.dart';
import 'package:challengeday1/screens/home_screen.dart';
import 'package:challengeday1/screens/photo_screen.dart';
import 'package:challengeday1/utilities/no_glow_behaviour.dart';
import 'package:flutter/material.dart';
import 'screens/search_screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Roboto',
      ),
      initialRoute: SearchScreen.id,
      routes: {
        SearchScreen.id: (context) => SearchScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        PhotoScreen.id: (context) => PhotoScreen(),
        AccountScreen.id: (context) => AccountScreen()
      },
      builder: (context, child) {
        return ScrollConfiguration(behavior: NoGlowBehavior(), child: child!);
      },
    );
  }
}
