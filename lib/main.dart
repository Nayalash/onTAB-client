import 'package:flutter/material.dart';
import 'package:on_tab/screens/app/add_screen.dart';

import 'screens/login/welcome_screen.dart';
import 'screens/login/login_screen.dart';
import 'screens/login/register_screen.dart';
import 'screens/app/home_screen.dart';
import 'screens/app/history_screen.dart';




void main() => runApp(onTab());

class onTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id : (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        HistoryScreen.id: (context) => HistoryScreen(),
        AddScreen.id: (context) => AddScreen(),
      },
    );
  }
}
