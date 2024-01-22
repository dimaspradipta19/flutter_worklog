import 'dart:developer';

import 'package:flutter/material.dart';

import '../../utils/styles.dart';
import '../../widgets/widget_leftside_login_screen.dart';
import '../home_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          // Left Side
          const WidgetLeftSideLoginScreen(),

          // Right Side
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 56.0, right: 100.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Account Login",
                      style: myTextTheme.headlineMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5.0, bottom: 37.0),
                      child: Text(
                        "If you are already a member you can login with your email address and password.",
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style:
                            myTextTheme.titleLarge!.copyWith(color: greyColor3),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Email address",
                          style: myTextTheme.titleLarge,
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _emailController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              hintText: "Masukkan email"),
                          validator: (valueEmail) {
                            if (valueEmail == null || valueEmail.isEmpty) {
                              return 'Please enter an email';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Password",
                          style: myTextTheme.titleLarge,
                        ),
                        const SizedBox(height: 12.0),
                        TextFormField(
                          controller: _passwordController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                              ),
                              hintText: "Masukkan password"),
                          validator: (valuePassword) {
                            if (valuePassword == null ||
                                valuePassword.isEmpty) {
                              return 'Please enter correct password';
                            } else {
                              return null;
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 20.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize:
                              Size(MediaQuery.of(context).size.width, 64.0)),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log("email ${_emailController.text}");
                          log("password ${_passwordController.text}");
                          Navigator.pushAndRemoveUntil(context,
                              MaterialPageRoute(
                            builder: (context) {
                              return const HomeScreen();
                            },
                          ), (route) => false);
                        }
                      },
                      child: const Text("Login"),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
