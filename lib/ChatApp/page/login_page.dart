import 'package:flutter/material.dart';
import 'package:professional_project/ChatApp/component/my_button.dart';
import 'package:professional_project/ChatApp/component/my_text_field.dart';
import 'package:professional_project/ChatApp/services/auth/auth_service.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final VoidCallback? onTap;
  const LoginPage({super.key, this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();

    //singIn user
    void singIn()async{
      // get the author service
      final authService= Provider.of<AuthService>(context, listen: false);

      try{
        await authService.signInWithEmailandPassword(emailController.text, passwordController.text);
      }catch(e){
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(e.toString(),),),
        );
      }
    }
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.message, size: 60),
                SizedBox(height: 20),
                Text(
                  "Welcome back you've been missed!",
                  style: TextStyle(fontSize: 18),
                ),
                SizedBox(height: 15),
                myTextField(
                  hintText: 'Email',
                  labelText: 'Email', controller: emailController, obscureText: false,),
                SizedBox(height: 15),
                myTextField(
                    hintText: 'Password',
                    labelText: 'Password', controller: passwordController, obscureText: true,),
                SizedBox(height: 20),

                ButtonWidget(text: 'Sign In',
                    onTap: singIn),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Not a member?'),
                    SizedBox(width: 5,),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Register Now',style: TextStyle(fontWeight: FontWeight.bold),)),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}






