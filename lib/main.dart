import 'package:dmsn/components/global_values.dart';
import 'package:dmsn/components/theme_app.dart';
import 'package:dmsn/screens/add_note_screen.dart';
import 'package:dmsn/screens/dashboard_screen.dart';
import 'package:dmsn/screens/login_screen.dart';
import 'package:dmsn/screens/notes_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp( MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: GlobalValues.banTheme,
      builder: (context,value,_) {

        ThemeData tema = ThemeData.light();
        switch(value){
          case 0: tema = ThemeData.dark(); break;
          case 1: tema = ThemeData.light(); break;
          case 2: tema = ThemeApp.warmTheme();
        }

        return MaterialApp(
          routes: {
            "/dash" : (context) => DashboardScreen(),
            "/note" : (context) => NotesScreen(),
            "/add"  : (context) => AddNoteScreen()
          },
          theme: tema,
          home: LoginScreen(),
        );
      }
    );
  }
}