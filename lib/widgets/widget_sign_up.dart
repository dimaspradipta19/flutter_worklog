import 'package:flutter/material.dart';

class WidgetSignUp extends StatelessWidget {
  const WidgetSignUp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account ?"),
        TextButton(onPressed: () {}, child: const Text("Sign up here"))
      ],
    );
  }
}
