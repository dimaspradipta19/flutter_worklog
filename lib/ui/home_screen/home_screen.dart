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
  final TextEditingController _timeStartController = TextEditingController();
  final TextEditingController _timeEndController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _dateController.dispose();
    _timeStartController.dispose();
    _timeEndController.dispose();
    _projectController.dispose();
  }

  Future<void> displayTimePicker(BuildContext context) async {
    var timeStart =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timeStart != null) {
      setState(() {
        _timeStartController.text = "${timeStart.hour}:${timeStart.minute}";
      });
    }
  }

  Future<void> displayTimePickerEnd(BuildContext context) async {
    var timeEnd =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());

    if (timeEnd != null) {
      setState(() {
        _timeEndController.text = "${timeEnd.hour}:${timeEnd.minute}";
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                color: thirdColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Stack(
                                  children: [
                                    const Icon(
                                      Icons.calendar_today_outlined,
                                      color: whiteColor,
                                    ),
                                    Center(
                                      child: Column(
                                        children: [
                                          Text(
                                            DateFormat.d()
                                                .format(DateTime.now()),
                                            style: myTextTheme.headlineMedium!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          ),
                                          Text(
                                            DateFormat.MMMM()
                                                .format(DateTime.now()),
                                            style: myTextTheme.headlineSmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Expanded(
                            flex: 3,
                            child: Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                color: thirdColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(14.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Filtered by",
                                      style: myTextTheme.titleMedium!.copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: whiteColor),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Center(
                                              child: DropdownMenu(
                                                hintText: "Period",
                                                dropdownMenuEntries: const [
                                                  DropdownMenuEntry(
                                                      label: "Today", value: 1),
                                                ],
                                                onSelected: (value) {
                                                  log(value.toString());
                                                },
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Center(
                                              child: DropdownMenu(
                                                hintText: "Projects",
                                                dropdownMenuEntries: const [
                                                  DropdownMenuEntry(
                                                      label: "Today", value: 1),
                                                ],
                                                onSelected: (value) {
                                                  log(value.toString());
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 4.0),
                          Expanded(
                            flex: 2,
                            child: Container(
                              height: 120,
                              decoration: const BoxDecoration(
                                color: thirdColor,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(8.0),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 14.0),
                                child: Row(
                                  children: [
                                    const Icon(Icons.watch_later_outlined,
                                        size: 34.0),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            "3.00 Hours",
                                            style: myTextTheme.headlineSmall,
                                          ),
                                          Text(
                                            "This Week",
                                            style: myTextTheme.titleMedium!
                                                .copyWith(color: greyColor3),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: secondaryColor,
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
                                                title:
                                                    const Text('Create Task'),
                                                content: SingleChildScrollView(
                                                  child: Column(
                                                    children: [
                                                      // TImestamp

                                                      Row(
                                                        children: [
                                                          // Date
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 48.0,
                                                                width: 234.0,
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      _dateController,
                                                                  readOnly:
                                                                      true,
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    labelText:
                                                                        "Date Picker",
                                                                    filled:
                                                                        true,
                                                                    prefixIcon:
                                                                        Icon(Icons
                                                                            .calendar_today_outlined),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide.none),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
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
                                                          const SizedBox(
                                                              width: 10.0),
                                                          // Duration Time
                                                          Row(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 48.0,
                                                                width: 234.0,
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      _timeStartController,
                                                                  readOnly:
                                                                      true,
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    labelText:
                                                                        "Start Time",
                                                                    filled:
                                                                        true,
                                                                    prefixIcon:
                                                                        Icon(Icons
                                                                            .calendar_today_outlined),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide.none),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: blackColor),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    displayTimePicker(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                  width: 10.0),
                                                              SizedBox(
                                                                height: 48.0,
                                                                width: 234.0,
                                                                child:
                                                                    TextField(
                                                                  controller:
                                                                      _timeEndController,
                                                                  readOnly:
                                                                      true,
                                                                  decoration:
                                                                      const InputDecoration(
                                                                    labelText:
                                                                        "End Time",
                                                                    filled:
                                                                        true,
                                                                    prefixIcon:
                                                                        Icon(Icons
                                                                            .calendar_today_outlined),
                                                                    enabledBorder:
                                                                        OutlineInputBorder(
                                                                            borderSide:
                                                                                BorderSide.none),
                                                                    focusedBorder:
                                                                        OutlineInputBorder(
                                                                      borderSide:
                                                                          BorderSide(
                                                                              color: blackColor),
                                                                    ),
                                                                  ),
                                                                  onTap: () {
                                                                    displayTimePickerEnd(
                                                                        context);
                                                                  },
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      const SizedBox(
                                                          height: 10.0),
                                                      DropdownMenu(
                                                        width: 480,
                                                        requestFocusOnTap: true,
                                                        label: const Text(
                                                            "Project Title"),
                                                        controller:
                                                            _projectController,
                                                        dropdownMenuEntries: const [
                                                          DropdownMenuEntry(
                                                              label: "Project1",
                                                              value: 1),
                                                          DropdownMenuEntry(
                                                              label: "Project2",
                                                              value: 2),
                                                          DropdownMenuEntry(
                                                              label: "Project3",
                                                              value: 3),
                                                          DropdownMenuEntry(
                                                              label: "Project4",
                                                              value: 4),
                                                          DropdownMenuEntry(
                                                              label: "Project5",
                                                              value: 5),
                                                        ],
                                                      ),
                                                      // Form title and desc task
                                                      const SizedBox(
                                                          height: 10.0),
                                                      Form(
                                                        key: _formKey,
                                                        child: Column(
                                                          children: [
                                                            TextFormField(
                                                              controller:
                                                                  _titleController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                          Radius.circular(
                                                                              10.0),
                                                                        ),
                                                                      ),
                                                                      hintText:
                                                                          "Title Task"),
                                                            ),
                                                            const SizedBox(
                                                                height: 12.0),
                                                            TextFormField(
                                                              maxLines: 3,
                                                              controller:
                                                                  _descriptionController,
                                                              decoration:
                                                                  const InputDecoration(
                                                                      border:
                                                                          OutlineInputBorder(
                                                                        borderRadius:
                                                                            BorderRadius.all(
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
                                                    ],
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Submit'),
                                                    onPressed: () {
                                                      showModalBottomSheet(
                                                        context: context,
                                                        builder: (context) {
                                                          return Column(
                                                            children: [
                                                              Text(
                                                                  "Hari: ${_dateController.text}"),
                                                              Text(
                                                                  "Jam: ${_timeStartController.text}"),
                                                              Text(
                                                                  "Title: ${_titleController.text}"),
                                                              Text(
                                                                  "Description: ${_descriptionController.text}"),
                                                              Text(
                                                                  "Project: ${_projectController.text}"),
                                                            ],
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: Text(
                                          "Create Task",
                                          style: myTextTheme.titleSmall!
                                              .copyWith(color: whiteColor),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 40.0),
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(8.0),
                        ),
                        color: forthColor,
                      ),
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
