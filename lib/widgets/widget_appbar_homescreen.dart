import 'package:flutter/material.dart';

import '../utils/styles.dart';

class AppbarHomePage extends StatelessWidget {
  const AppbarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      decoration: const BoxDecoration(color: whiteColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo_worklog.png",
              height: 66.0,
              width: 64.0,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi, User",
                  style: myTextTheme.bodyLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4.0),
                Text(
                  "Create & Make Daily Task",
                  style: myTextTheme.bodySmall!
                      .copyWith(fontWeight: FontWeight.w400),
                ),
              ],
            ),
            Expanded(child: Container()),
            Image.asset(
              "assets/images/logo_avatar.png",
              width: 48.0,
              height: 48.0,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "User 1",
                  style: myTextTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Developer",
                  style: myTextTheme.titleSmall,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
