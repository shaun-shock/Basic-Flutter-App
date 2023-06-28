import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'Services/login_with_google.dart';

class LoginData {
  final String email;
  final String password;

  LoginData({required this.email, required this.password});
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async{
    await GoogleSignInApi.login();
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;
      final password = _passwordController.text;

      // Create the login data object
      final loginData = LoginData(email: email, password: password);

      //Look for the data in the database, send to backend

      // Clear the form
      _emailController.clear();
      _passwordController.clear();
      if(email=="email"&& password=="password")
        {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Login Successful'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );}
      else {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Error'),
              content: Text('Please enter valid email and password'),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Please enter valid email and password'),
            actions: [
              TextButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, // Set background color to white
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundImage: AssetImage("lib/Assets/AIOT.jpg")
              // Add your circular photo here
            ),
            SizedBox(height: 24.0),
            Container(
              margin: EdgeInsets.all(16),
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.grey[300], // Set container color to grey
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    _buildTextField('Email', isPassword: false),
                    SizedBox(height: 16.0),
                    _buildTextField('Password', isPassword: true),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed:(){ Navigator.of(context, rootNavigator: true).pushNamed("/search");},
                      child: Text('                                 Sign In                                 ',style:TextStyle(color: Colors.black)),
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        primary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    TextButton(
                      onPressed: () {
                        // Forgot password functionality
                      },
                      child: Text('Forgot Password?',style:TextStyle(color: Colors.black)),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Column(
              children: [SizedBox(width: 10),
                ElevatedButton(
                  onPressed: signIn

                    // Sign in with Google functionality
                  ,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,

                    children: [SizedBox(width:10),
                      Image.network(
                        'https://www.nicepng.com/png/detail/13-134988_google-logo-png-transparent-google-g-logo-black.png',
                        height: 40.0,
                        width: 37.0,
                        fit: BoxFit.cover,
                      ),
                      SizedBox(width: 8.0),
                      Text('                      Sign In with Google                                       ',style:TextStyle(color: Colors.black)),
                    ],
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    primary: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                ElevatedButton(
                  onPressed: () {
                    // New user functionality
                  },
                  child: Text('                         New User? Create a New Account                         ',style:TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(vertical: 16.0),
                    primary: Colors.grey[300],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),

                    ),
                    elevation: 10
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, {required bool isPassword}) {
    return TextFormField(
      controller: isPassword ? _passwordController : _emailController,
      obscureText: isPassword,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter a ${isPassword ? 'password' : 'valid email'}';
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: label,
        border: InputBorder.none,
        filled: true,
        fillColor: Colors.white,
        labelStyle: TextStyle(color: Colors.black), // Set text color to solid black
      ),
    );
  }
}
