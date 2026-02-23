import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:professional_project/ChatApp/page/home_page.dart';
import 'package:professional_project/ChatApp/services/login_or_register.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot){
            //user is logged in
            if(snapshot.hasData){
              return const HomePage();
            }
            //user is Not logged is
            else{
              return const LoginOrRegister();
            }
          }
      ),
    );
  }
}
