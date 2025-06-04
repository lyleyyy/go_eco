import 'dart:convert';
import 'package:flutter/material.dart';
import '../../Encryption.dart';
import '../../netconfig.dart';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController usernameController;

  @override
  void initState() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    usernameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Register"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Image.asset("images/logo.jpg"),
              const SizedBox(height: 30),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: (value) {
                  if (!RegExp(
                      r"^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$")
                      .hasMatch(value!)) {
                    return "Invalid email";
                  }
                },
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
                controller: usernameController,
                validator: (value) {
                  if (value == null) {
                    return "";
                  }
                  if (value.length < 3) {
                    return "username should be over 3.";
                  }
                },
                decoration: const InputDecoration(
                    hintText: 'Please enter your username',
                    prefixIcon: Icon(Icons.supervised_user_circle_sharp),
                    label: Text("username"),
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
                validator: (value) {
                  if (value == null) {
                    return "";
                  }
                  if (value.length < 8) {
                    return "Password length should be over 8.";
                  }
                  if (!RegExp(
                      r"[A-Z]")
                      .hasMatch(value)) {
                    return "Password should include at least one upper letter.";
                  }
                  if (!RegExp(
                      r"[a-z]")
                      .hasMatch(value)) {
                    return "Password should include at least one lower letter.";
                  }
                  if (!RegExp(r"[0-9]")
                      .hasMatch(value)) {
                    return "Password should include at least one number.";
                  }
                },
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
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    var valid = _formKey.currentState!.validate();
                    if (!valid) {
                      return;
                    }
                    String email = emailController.text;
                    String password = passwordController.text;
                    String username = usernameController.text;
                   NetConfig.checkExist(email).then((value) {
                     dynamic data = jsonDecode(value.toString());
                     if (data != null && data.isEmpty) {
                       NetConfig.register(email, Encryption.encryptAES
                         (password),
                       username);
                       NetConfig.insert(email);
                       Navigator.of(context).pop();
                     } else {
                       showDialog(context: context, builder: (x) {
                         return const AlertDialog(
                           content: Text("Email address exists."),
                         );
                     });
                     }
                   });
                  },
                  child: const Text("Register")),
            ],
          ),
        ),
      ),
    );
  }
}