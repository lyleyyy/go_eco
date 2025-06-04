import 'dart:convert';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_eco/netconfig.dart';

import '../../Encryption.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController emailController;
  late TextEditingController passwordController;
  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Form(
        key: GlobalKey(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset("images/logo.jpg"),
              const SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                    hintText: 'Please enter your email address',
                    prefixIcon: Icon(Icons.email),
                    label: Text("email"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ))),
              ),
              const SizedBox(height: 20),
              TextFormField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                    hintText: "Please enter your password",
                    prefixIcon: Icon(Icons.key),
                    label: Text("password"),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.blue,
                      width: 2,
                    ))),
              ),
              const SizedBox(height: 50,),
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'By continuing, you are agreed to ',
                  style: const TextStyle(fontSize: 14, color: Colors.black),
                  children: [
                    TextSpan(
                      text: 'Terms of Service',
                      style: const TextStyle(color: Colors.blue),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          showDialog(context: context, builder: (xx) {
                            return  AlertDialog(
                              title: const Text("Terms of Service"),
                              content: const Text("Content"),
                              actions: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text("Cancel")
                                )
                              ],
                            );
                          });
                        }
                    ),
                    const TextSpan(
                      text: ' and '
                    ),
                    TextSpan(
                      text: "Privacy Policy",
                      style: const TextStyle(color: Colors.blue),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            showDialog(context: context, builder: (xx) {
                              return  AlertDialog(
                                title: const Text("Privacy Policy"),
                                content: const Text("Content"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel")
                                  )
                                ],
                              );
                            });
                          }
                    ),
                    const TextSpan(
                        text: '.'
                    ),
                  ]
                ),
              ),
              const SizedBox(height: 150),
              ElevatedButton(
                  onPressed: () {
                    String email = emailController.text;
                    String password = passwordController.text;
                    NetConfig.login(email, Encryption.encryptAES(password)).then((value) {
                      dynamic data = jsonDecode(value.toString());
                      if (data != null && data.isNotEmpty){
                        String username = data[0]['username'];
                        Navigator.pushNamed(context, "/Tabs",
                        arguments: {
                          "email": email,
                          'username': username
                        });
                      } else {
                        showDialog(
                            context: context,
                            builder: (x) {
                              return  AlertDialog(
                                title: const Text("Login failed"),
                                content: const Text("Please check your email "
                                    "or "
                                    "password!"),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text("Cancel"))
                                ],
                              );
                            }
                        );
                      }
                    });
                  },
                  child: const Text("Login")),
              const SizedBox(height: 50,),
              const Text("Do not have an account yet?"),
              TextButton(
                  onPressed: (){
                    Navigator.pushNamed(context, "/Register");
                  },
                  child: const Text("Click here "
                      "to register!"))
            ],
          ),
        ),
      ),
    );
  }
}
