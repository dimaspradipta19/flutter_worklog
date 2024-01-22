import 'package:flutter/material.dart';

import '../utils/styles.dart';

class WidgetLeftSideLoginScreen extends StatelessWidget {
  const WidgetLeftSideLoginScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        children: [
          Container(
            color: primaryColor,
          ),
          Center(
            child: Image.asset(
              "assets/images/logo_worklog.png",
              height: 100.0,
            ),
          ),
        ],
      ),
    );
  }
}
