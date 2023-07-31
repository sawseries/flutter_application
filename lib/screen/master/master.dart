import 'package:flutter/material.dart';
import 'package:flutter_application/screen/auth/register.dart';
import 'package:flutter_application/controller/Login_Controller.dart';
import 'package:get/get.dart';

class MasterScreen extends StatefulWidget {
  const MasterScreen({Key? key}) : super(key: key);
  @override
  State<MasterScreen> createState() => _MasterFormState();
}

class _MasterFormState extends State<MasterScreen> {
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
    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'some password',
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
            onPressed: () {},
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
            email,
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
