
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
    navigateToNextScreen();
  }

  Future<void> navigateToNextScreen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool isAuthenticated = prefs.getBool('isAuthenticated') ?? false;
    bool isFirstTime = prefs.getBool('isFirstTime') ?? true;
    Widget nextScreen;

    // If authenticated, go to MyNewPage; otherwise, go to OTPScreen
    nextScreen = isFirstTime
        ? MyNewPage(
      user: User(
        id: prefs.getInt('id') ?? 0,
        username: prefs.getString('username') ?? '',
        email: prefs.getString('email') ?? '',
        firstName: prefs.getString('firstName') ?? '',
        lastName: prefs.getString('lastName') ?? '',
        gender: prefs.getString('gender') ?? '',
        image: prefs.getString('image') ?? '',
      ),
      verificationId: ' ',
    )
        : OTPScreen(verificationId: ' ');

    if (!isAuthenticated) {
      nextScreen = LoginPage();
    }

    prefs.setBool('isFirstTime', false);

    Future.delayed(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => nextScreen),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    // You can add your SplashScreen UI here if needed
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(), // or any other UI component
      ),
    );
  }
}

// Placeholder implementations for LoginPage, OTPScreen, and MyNewPage
class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Center(
        child: Text('Login Page Content'),
      ),
    );
  }
}

class OTPScreen extends StatelessWidget {
  final String verificationId;

  OTPScreen({required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('OTP Screen'),
      ),
      body: Center(
        child: Text('OTP Screen Content'),
      ),
    );
  }
}

class MyNewPage extends StatelessWidget {
  final User user;
  final String verificationId;

  MyNewPage({required this.user, required this.verificationId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My New Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Info: ${user.username}'),
            Text('Verification ID: $verificationId'),
          ],
        ),
      ),
    );
  }
}

class User {
  final int id;
  final String username;
  final String email;
  final String firstName;
  final String lastName;
  final String gender;
  final String image;

  User({
    required this.id,
    required this.username,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.image,
  });
}
