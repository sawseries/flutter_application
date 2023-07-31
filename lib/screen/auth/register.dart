import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);
  @override
  State<RegisterScreen> createState() => _RegisterState();
}

class _RegisterState extends State<RegisterScreen> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController fullnmController = TextEditingController();

  PreferredSizeWidget _appBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: const Icon(Icons.arrow_back),
      ),
      centerTitle: true,
      title: const Text("Register"),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logo = Image.asset('asset/images/logo.png');
    final txtemail = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'alucard@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final txtfullname = TextField(
      controller: fullnmController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Full Name',
      ),
    );
    final txtusername = TextField(
      controller: usernameController,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'User Name',
      ),
    );
    final txtpassword = TextFormField(
      autofocus: false,
      initialValue: 'some password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );
    final registButton = Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: ElevatedButton(
            onPressed: () {
              print(fullnmController.text);
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
            ),
            child: const Text('Sign up')));

    return Scaffold(
      appBar: _appBar(context),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: ListView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            txtfullname,
            const SizedBox(height: 8.0),
            txtemail,
            const SizedBox(height: 8.0),
            txtusername,
            const SizedBox(height: 8.0),
            txtpassword,
            const SizedBox(height: 8.0),
            registButton
          ],
        ),
      ),
    );
  }
}
