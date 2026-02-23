import 'package:flutter/material.dart';
import 'package:professional_project/ChatApp/component/my_button.dart';
import 'package:professional_project/ChatApp/component/my_text_field.dart';
import 'package:professional_project/ChatApp/services/auth/auth_service.dart';
import 'package:provider/provider.dart';
class RegisterPage extends StatefulWidget {
  final VoidCallback? onTap;
  const RegisterPage({super.key, this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController emailController=TextEditingController();
    TextEditingController passwordController=TextEditingController();
    TextEditingController confirmPasswordController=TextEditingController();

    //singUp user
    void singUp()async{
      if(passwordController.text != confirmPasswordController.text){
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password do not match'),),
        );
        return;
      }
      final authService= Provider.of<AuthService>(context, listen: false);

      try{
        await authService.signUpWithEmailandPassword(emailController.text, passwordController.text);
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
                  "Let's create account for you!",
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
                SizedBox(height: 15),
                myTextField(
                  hintText: 'Confirm Password',
                  labelText: 'Confirm Password', controller: confirmPasswordController, obscureText: true,),
                SizedBox(height: 20),

                //singUp button
                ButtonWidget(text: 'Sign Up',onTap: singUp),
                SizedBox(height: 25),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already a member?'),
                    SizedBox(width: 5,),
                    GestureDetector(
                        onTap: widget.onTap,
                        child: Text('Login Now',style: TextStyle(fontWeight: FontWeight.bold),)),
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