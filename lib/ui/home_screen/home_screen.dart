import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_worklog/utils/styles.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              // AppBar
              const AppbarHomePage(),

              // Container date now, filtered by & button add task
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 100.0, vertical: 50.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        // date time now
                        Container(
                          height: 120,
                          width: 272.0,
                          decoration:
                              const BoxDecoration(color: secondaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Date",
                                  style: myTextTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: whiteColor),
                                ),
                                Container(
                                  height: 50.0,
                                  width: 220.0,
                                  decoration:
                                      const BoxDecoration(color: whiteColor),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.calendar_month,
                                          size: 16.0),
                                      Text(
                                        DateFormat.yMd().format(DateTime.now()),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 38.0),
                        // filtered by
                        Container(
                          height: 120,
                          width: 518.0,
                          decoration:
                              const BoxDecoration(color: secondaryColor),
                          child: Padding(
                            padding: const EdgeInsets.all(14.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Filtered by",
                                  style: myTextTheme.titleMedium!.copyWith(
                                      fontWeight: FontWeight.w600,
                                      color: whiteColor),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    DropdownMenu(
                                      width: 220.0,
                                      hintText: "Period",
                                      dropdownMenuEntries: const [
                                        DropdownMenuEntry(
                                            label: "Today", value: 1),
                                      ],
                                      onSelected: (value) {
                                        log(value.toString());
                                      },
                                    ),
                                    const SizedBox(width: 20),
                                    DropdownMenu(
                                      width: 220.0,
                                      hintText: "Projects",
                                      dropdownMenuEntries: const [
                                        DropdownMenuEntry(
                                            label: "Today", value: 1),
                                      ],
                                      onSelected: (value) {
                                        log(value.toString());
                                      },
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(child: Container()),
                        // button add task
                        ElevatedButton(
                          onPressed: () {},
                          child: const Text("Add Task"),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70.0),
                    Table(
                      border: TableBorder.all(color: blackColor, width: 1.0),
                      children: const [
                        TableRow(
                          children: [
                            Text(
                              "Senin",
                            ),
                            Text(
                              "Selasa",
                            ),
                            Text(
                              "Rabu",
                            ),
                            Text(
                              "Kamis",
                            ),
                            Text(
                              "Jumat",
                            ),
                          ],
                        ),
                        TableRow(
                          children: [
                            Text(
                              "Senin",
                            ),
                            Text(
                              "Selasa",
                            ),
                            Text(
                              "Rabu",
                            ),
                            Text(
                              "Kamis",
                            ),
                            Text(
                              "",
                            ),
                          ],
                        ),
                      ],
                    ),

                    Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      color: greyColor1,
                      child: const Column(
                        children: [],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppbarHomePage extends StatelessWidget {
  const AppbarHomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          "assets/images/logo_worklog.png",
          height: 66.0,
          width: 64.0,
        ),
        const SizedBox(width: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, User",
              style:
                  myTextTheme.bodyLarge!.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4.0),
            Text(
              "Create & Make Daily Task",
              style:
                  myTextTheme.bodySmall!.copyWith(fontWeight: FontWeight.w400),
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
          children: [
            Text(
              "User 1",
              style:
                  myTextTheme.titleLarge!.copyWith(fontWeight: FontWeight.w600),
            ),
            Text(
              "Developer",
              style: myTextTheme.titleSmall,
            ),
          ],
        )
      ],
    );
  }
}
