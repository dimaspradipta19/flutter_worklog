import 'package:flutter/material.dart';
import 'package:flutter_worklog/ui/login_screen/login_screen.dart';

import '../utils/styles.dart';

class AppbarHomePage extends StatelessWidget {
  const AppbarHomePage({super.key, required this.fullName});

  final String fullName;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 100.0,
      decoration: const BoxDecoration(color: whiteColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 100.0),
        child: Row(
          children: [
            Image.asset(
              "assets/images/logo_worklog_2.png",
              height: 66.0,
              width: 64.0,
            ),
            const SizedBox(width: 16.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hi, $fullName",
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
                  fullName,
                  style: myTextTheme.titleLarge!
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  "Developer",
                  style: myTextTheme.titleSmall,
                ),
              ],
            ),
            const SizedBox(width: 10),
            ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: redColor2),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text("Are you sure want to logout?"),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushAndRemoveUntil(context,
                                  MaterialPageRoute(
                                builder: (context) {
                                  return const LoginScreen();
                                },
                              ), (route) => false);
                            },
                            child: const Text("Yes"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text("No"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text(
                  "Logout",
                  style: myTextTheme.titleMedium!.copyWith(color: whiteColor),
                ))
          ],
        ),
      ),
    );
  }
}
