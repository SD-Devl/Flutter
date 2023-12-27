import 'package:flutter/material.dart';
import 'OTP/OTP.dart';
import 'UserInfo.dart';

class MyNewPage extends StatelessWidget {
  final User? user;
  final String verificationId;

  MyNewPage({required this.user, required this.verificationId});

  void _navigateToOTPScreen(BuildContext context) {
    if (user != null && context != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OTPScreen(user: user, verificationId: verificationId),
        ),
      );
    } else {
      print("User or context is null. Cannot navigate to OTPScreen.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Information'),
      ),
      body: Center(
        child: user != null
            ? Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage(user!.image),
                radius: 50,
              ),
              SizedBox(height: 16),
              Text(
                'Username: ${user!.username}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8),
              Text(
                'Email: ${user!.email}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Name: ${user!.firstName} ${user!.lastName}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'Gender: ${user!.gender}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 8),
              Text(
                'ID: ${user!.id}',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => _navigateToOTPScreen(context),
                child: Text('Verify User ID'),
              ),
            ],
          ),
        )
            : Text('User data is not available'),
      ),
    );
  }
}
