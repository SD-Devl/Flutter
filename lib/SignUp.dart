import 'package:finalproj/theme.dart';
import 'package:flutter/material.dart';


class signUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.themeData, // Apply the theme here
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
        ),
        body: SignUpForm(),
      ),
    );
  }
}
class SignUpForm extends StatefulWidget {
  @override
  _SignUpFormState createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _ageController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _gender = 'Male'; // Set a default value

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image:AssetImage('assets/img1.png'),fit: BoxFit.cover ),
      ),
      padding: EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          children: [

            SizedBox(height: 16.0),
            TextFormField(

              controller: _firstNameController,
              decoration: InputDecoration(labelText: 'First Name',
                prefixIcon:Icon(Icons.person),
                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)),),),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your first name';
                }
                return null;
              },
            ),

            SizedBox(height: 10,),
            TextFormField(
              controller: _lastNameController,
              decoration: InputDecoration(labelText: 'Last Name',
                prefixIcon: Icon(Icons.person),
                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)),),),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),


            SizedBox(height: 10,),
            TextFormField(
              controller: _ageController,
              decoration: InputDecoration(labelText: 'Age',
                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)),),),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your last name';
                }
                return null;
              },
            ),


            SizedBox(height: 10,),
            DropdownButtonFormField<String>(
              value: _gender,

              onChanged: (value) {
                setState(() {
                  _gender = value!;
                });
              },
              items: <String>['Male', 'Female', 'Other']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              decoration: InputDecoration(labelText: 'Gender' ,
                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)),),),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select your gender';
                }
                return null;
              },
            ),

            SizedBox(height: 10,),
            TextFormField(
              controller: _phoneNumberController,
              decoration: InputDecoration(labelText: 'PhoneNumber' ,
                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                prefix:Icon(Icons.phone),),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your phone number';
                }
                return null;
              },
            ),


            SizedBox(height: 10,),
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,

              decoration: InputDecoration(
                labelText: 'Email' ,
                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                prefixIcon:Icon(Icons.email),
              ),

              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter email';
                }
                return null;
              },
            ),

            SizedBox(height: 10,),
            TextFormField(
              controller: _passwordController,

              decoration: InputDecoration(
                labelText: 'password',
                border: OutlineInputBorder( borderRadius: BorderRadius.all(Radius.circular(15.0)),),
                prefixIcon:Icon(Icons.password),
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter password';
                }
                return null;
              },
            ),
            // Other TextFormField widgets for Last Name, Age, Phone Number, Email, and Password
            //

            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(backgroundColor:MaterialStateProperty.all<Color>(Color.fromRGBO(54, 52, 163, 100))),
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Handle form submission
                  // Access input values using controllers or variables
                  // For example:
                  print('First Name: ${_firstNameController.text}');
                  print('Last Name: ${_lastNameController.text}');
                  print('Age: ${_ageController.text}');
                  print('Phone Number: ${_phoneNumberController.text}');
                  print('Email: ${_emailController.text}');
                  print('Gender: $_gender');
                  print('Password: ${_passwordController.text}');
                }
              },
              child: Text('Sign Up' ,style: TextStyle(color: Colors.white, fontSize: 25),),

            ),
          ],
        ),
      ),
    );
  }
}