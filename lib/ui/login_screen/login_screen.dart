import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/provider/login_provider.dart';
import 'package:flutter_worklog/utils/enum.dart';
import 'package:provider/provider.dart';

import '../../utils/styles.dart';
import '../../widgets/widget_leftside_login_screen.dart';
import '../../widgets/widget_sign_up.dart';
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
    final providerLogin =
        Provider.of<PostLoginProvider>(context, listen: false);
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
                    const WidgetTextLogin(),
                    const WidgetTextDescLogin(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Username",
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
                              hintText: "Masukkan username"),
                          validator: (valueEmail) {
                            if (valueEmail == null || valueEmail.isEmpty) {
                              return 'Please enter an username';
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
                          obscureText: true,
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
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          print("email ${_emailController.text}");
                          print("password ${_passwordController.text}");

                          await providerLogin.postLogin(
                              _emailController.text, _passwordController.text);

                          var testing =
                              providerLogin.hasilPost!.success.toString();

                          print("succes alert ${testing}");

                          if (providerLogin.state == ResultState.hasData) {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(
                              builder: (context) {
                                // return HomeScreen();
                                return HomeScreen(
                                  userId: providerLogin
                                          .hasilPost?.messages.userId ??
                                      0,
                                  username: providerLogin
                                          .hasilPost?.messages.username ??
                                      "User Dummy",
                                  fullName: providerLogin
                                          .hasilPost?.messages.fullName ??
                                      "fullname Dummy",
                                );
                              },
                            ), (route) => false);
                          } else {
                            print("errorasldkjaskdjlaksjdasdjaskjdlkasjd");
                          }
                        }
                      },
                      child: Text(
                        "Login",
                        style: myTextTheme.titleMedium!
                            .copyWith(color: whiteColor),
                      ),
                    ),
                    const WidgetSignUp()
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

class WidgetTextDescLogin extends StatelessWidget {
  const WidgetTextDescLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0, bottom: 37.0),
      child: Text(
        "If you are already a member you can login with your username and password.",
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
        style: myTextTheme.titleLarge!.copyWith(color: greyColor3),
      ),
    );
  }
}

class WidgetTextLogin extends StatelessWidget {
  const WidgetTextLogin({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      "Account Login",
      style: myTextTheme.headlineMedium!.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
