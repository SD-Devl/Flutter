import 'package:finalproj/theme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


import 'SplashScreen.dart';


void main()  async {
  //WidgetsFlutterBinding.ensureInitialized() is a method used to ensure that the Flutter framework's binding is initialized before any other operations are performed.
  // This method is often called at the beginning of the main()
  WidgetsFlutterBinding.ensureInitialized();
  //The code snippet await Firebase.initializeApp(); is commonly used in Flutter applications that integrate Firebase services. This line of code initializes the Firebase framework,
  // allowing you to use various Firebase features in your Flutter app.
  await Firebase.initializeApp();
  runApp( Mymain());
}

class Mymain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Splash Screen",
      theme: AppTheme.themeData,

      // Set the initial page here
      /*routes: {
        '/registration': (context) => MyRegister(),
        '/login': (context) => MyLogin(),
      },*/
      home:SplashScreen(),
    );
  }
}
