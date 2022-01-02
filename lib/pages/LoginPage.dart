// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:pembelajaran/services/AuthService.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController nikController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(32, 32, 32, 0),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.fromLTRB(0, 40, 0, 40),
              height: 240.0,
              width: 240.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/logo.jpeg'),
                  fit: BoxFit.fill,
                ),
                shape: BoxShape.rectangle,
              ),
            ),
            TextField(
              controller: nikController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'NIK',
              ),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Password',
              ),
            ),
            SizedBox(
              height: 20,
            ),
            RaisedButton(
                color: Colors.green,
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  FocusManager.instance.primaryFocus?.unfocus();
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (BuildContext context) {
                      return WillPopScope(
                        onWillPop: () => Future.value(false),
                        child: const AlertDialog(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          content: Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      );
                    },
                  );
                  Auth.login(nikController.text, passwordController.text);
                }),
          ],
        ),
      ),
    );
  }
}
