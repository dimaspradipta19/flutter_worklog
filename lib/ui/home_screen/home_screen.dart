import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_worklog/utils/styles.dart';
import 'package:intl/intl.dart';

import '../../widgets/widget_appbar_homescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _timeController.dispose();
  }

  Future displayTimePicker(BuildContext context) async {
    var time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (time != null) {
      setState(() {
        _timeController.text = "${time.hour}:${time.minute}";
      });
    }
  }

  Future<void> _selectDate() async {
    DateTime? _picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime.now().subtract(
          const Duration(days: 1),
        ),
        lastDate: DateTime.now());

    if (_picked != null) {
      setState(() {
        _dateController.text = _picked.toString().split(" ")[0];
      });
    }
  }

  List<String> daysOfWeek = [
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ];

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
                          style: ElevatedButton.styleFrom(
                            backgroundColor: secondaryColor,
                            fixedSize: const Size(150.0, 48.0),
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(5.0),
                              ),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text('Create Task'),
                                  content: SingleChildScrollView(
                                    child: Column(
                                      children: [
                                        DropdownMenu(
                                          requestFocusOnTap: true,
                                          dropdownMenuEntries: const [
                                            DropdownMenuEntry(
                                                label: "Project1", value: 1),
                                            DropdownMenuEntry(
                                                label: "Project2", value: 2),
                                            DropdownMenuEntry(
                                                label: "Project3", value: 3),
                                            DropdownMenuEntry(
                                                label: "Project4", value: 4),
                                            DropdownMenuEntry(
                                                label: "Project5", value: 5),
                                          ],
                                          onSelected: (value) {
                                            log(value.toString());
                                          },
                                        ),
                                        // TImestamp
                                        Row(
                                          children: [
                                            // Date
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 48.0,
                                                  width: 234.0,
                                                  child: TextField(
                                                    controller: _dateController,
                                                    readOnly: true,
                                                    decoration:
                                                        const InputDecoration(
                                                      labelText: "DATE",
                                                      filled: true,
                                                      prefixIcon: Icon(Icons
                                                          .calendar_today_outlined),
                                                      enabledBorder:
                                                          OutlineInputBorder(
                                                              borderSide:
                                                                  BorderSide
                                                                      .none),
                                                      focusedBorder:
                                                          OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: blackColor),
                                                      ),
                                                    ),
                                                    onTap: () {
                                                      _selectDate();
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(width: 10.0),
                                            // Duration
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const Text("Duration Hour"),
                                                Container(
                                                  height: 48.0,
                                                  width: 234.0,
                                                  color: whiteColor,
                                                  // child: TextField(
                                                  //   controller: _dateController,
                                                  //   readOnly: true,
                                                  //   decoration:
                                                  //       const InputDecoration(
                                                  //     labelText: "Timepicker",
                                                  //     filled: true,
                                                  //     prefixIcon: Icon(Icons
                                                  //         .calendar_today_outlined),
                                                  //     enabledBorder:
                                                  //         OutlineInputBorder(
                                                  //             borderSide:
                                                  //                 BorderSide
                                                  //                     .none),
                                                  //     focusedBorder:
                                                  //         OutlineInputBorder(
                                                  //       borderSide: BorderSide(
                                                  //           color: blackColor),
                                                  //     ),
                                                  //   ),
                                                  //   onTap: () {
                                                  //     displayTimePicker(context);
                                                  //   },
                                                  // ),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        // Form title and desc task
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 20.0),
                                          child: Form(
                                            key: _formKey,
                                            child: Column(
                                              children: [
                                                TextFormField(
                                                  controller: _titleController,
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                          ),
                                                          hintText:
                                                              "Title Task"),
                                                ),
                                                const SizedBox(height: 12.0),
                                                TextFormField(
                                                  maxLines: 3,
                                                  controller:
                                                      _descriptionController,
                                                  decoration:
                                                      const InputDecoration(
                                                          border:
                                                              OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  10.0),
                                                            ),
                                                          ),
                                                          hintText:
                                                              "Description Task"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  actions: <Widget>[
                                    TextButton(
                                      child: const Text('Submit'),
                                      onPressed: () {
                                        print(_dateController.text);
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: Text(
                            "Create Task",
                            style: myTextTheme.titleMedium!
                                .copyWith(color: whiteColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 70.0),
                    Container(
                      color: forthColor,
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: Center(
                        child: ListView.builder(
                          itemCount: daysOfWeek.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          padding: EdgeInsets.zero,
                          itemBuilder: (context, indexDay) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20.0),
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    Text(daysOfWeek[indexDay]),
                                    SizedBox(
                                      width: 200.0,
                                      child: ListView.builder(
                                        shrinkWrap: true,
                                        itemCount: indexDay + 1,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        padding: EdgeInsets.zero,
                                        itemBuilder: (context, indexCard) {
                                          return InkWell(
                                            onTap: () {},
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(20.0),
                                              child: Container(
                                                height: indexCard.isEven
                                                    ? 20 +
                                                        indexCard.toDouble() *
                                                            20
                                                    : 20,
                                                width: 200,
                                                color: yellowColor1,
                                                child:
                                                    Text(indexCard.toString()),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
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
