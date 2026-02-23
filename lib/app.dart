
import 'package:flutter/material.dart';
import 'package:professional_project/API_Live_Data/api_call.dart';
import 'package:professional_project/ChatApp/page/home_page.dart';
//import 'package:professional_project/ChatApp/login_page.dart';
import 'package:professional_project/ChatApp/page/login_page.dart';
import 'package:professional_project/ChatApp/page/register_page.dart';
import 'package:professional_project/ChatApp/services/auth/auth_gate.dart';
import 'package:professional_project/ChatApp/services/login_or_register.dart';
import 'package:professional_project/Live_Test/Live_test.dart';
import 'package:professional_project/Money_management/Home_Page.dart';
import 'package:professional_project/NotesApp/Notes_Home.dart';
import 'package:professional_project/Task_Node_App/ui/task_home_page.dart';


import 'CourseCardProject/Card_Design.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        // brightness: Brightness.dark,
        // primaryColor: Colors.blue,
        // primarySwatch: Colors.blue,
        // scaffoldBackgroundColor: Colors.grey,

        appBarTheme: AppBarTheme(
          backgroundColor: Colors.orange,
          centerTitle: true,
        ),
        textTheme: TextTheme(
          bodySmall: TextStyle(fontSize: 18),
        ),

        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.orange,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),

        inputDecorationTheme: InputDecorationTheme(
          hintStyle: TextStyle(fontSize: 18),
          labelStyle: TextStyle(fontSize: 18),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
      ),

      home: ApiCall(),
    );
  }
}
