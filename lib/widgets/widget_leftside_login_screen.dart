import 'package:flutter/material.dart';

class WidgetLeftSideLoginScreen extends StatelessWidget {
  const WidgetLeftSideLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Image.asset(
        "assets/images/logo_login_screen.png",
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fitWidth,
        // height: 100.0,
      ),
    );
  }
}
