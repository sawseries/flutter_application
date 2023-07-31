import 'package:flutter/material.dart';
import 'package:flutter_application/screen/auth/register.dart';
import 'package:flutter_application/controller/Login_Controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => _LogInFormState();
}

class _LogInFormState extends State<LoginScreen> {
  TextEditingController userText = TextEditingController();
  TextEditingController PassText = TextEditingController();
  void navigateTo(Widget screen) {
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => screen,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset('asset/images/logo.png');
    final username = TextFormField(
      controller: userText,
      keyboardType: TextInputType.text,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Username',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      controller: PassText,
      autofocus: false,
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
            onPressed: () {
              Map<String, dynamic> data = {
                "username": userText.text,
                "password": PassText.text,
              };
              LoginController().AuthenLogin(context, data);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text('Login')));

    final forgotLabel = TextButton(
      onPressed: () {
        //forgot password screen
      },
      child: const Text(
        'Forgot Password',
      ),
    );

    final registLabel = ElevatedButton(
      child: const Text(
        'Register',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        navigateTo(const RegisterScreen());
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            const SizedBox(height: 48.0),
            username,
            const SizedBox(height: 8.0),
            password,
            const SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
            registLabel
          ],
        ),
      ),
    );
  }
}
