import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:professional_project/ChatApp/services/auth/auth_service.dart';
import 'package:professional_project/app.dart';
import 'package:provider/provider.dart';

main() async{

 // Firebase code********************
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  print(" Firebase Connected Successfully ");
 // Firebase code********************

  // runApp(MyApp());
  runApp(
      ChangeNotifierProvider(create: (context)=> AuthService(),
      child: const MyApp(),
      ),
  );
}