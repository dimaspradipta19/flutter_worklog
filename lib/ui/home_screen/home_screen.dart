import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/provider/picker_provider.dart';
import 'package:flutter_worklog/data/provider/post_data_dummy_provider.dart';
import 'package:flutter_worklog/models/post_data_dummy_model.dart';
import 'package:flutter_worklog/utils/styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../widgets/widget_appbar_homescreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _projectController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _titleController.dispose();
    _descriptionController.dispose();
    _projectController.dispose();
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
      backgroundColor: forthColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // TODO: AppBar homepage
            const AppbarHomePage(),

            // TODO: container date now, filtered by & button add task
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        //TODO: Current Date
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
                                          DateFormat.d().format(DateTime.now()),
                                          style: myTextTheme.headlineMedium!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
                                        ),
                                        Text(
                                          DateFormat.MMMM()
                                              .format(DateTime.now()),
                                          style: myTextTheme.headlineSmall!
                                              .copyWith(
                                                  fontWeight: FontWeight.bold),
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
                        // TODO: Container filtered by
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
                        // TODO: Button Create Task
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 14.0),
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
                                        var pickerProvider =
                                            Provider.of<PickerProvider>(context,
                                                listen: false);
                                        showDialog(
                                          context: context,
                                          builder: (context) {
                                            return AlertDialog(
                                              title: const Text('Create Task'),
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    // TODO: Datepicker, Start Time, End Time
                                                    Row(
                                                      children: [
                                                        // Date
                                                        SizedBox(
                                                          height: 48.0,
                                                          width: 234.0,
                                                          child: TextField(
                                                            controller:
                                                                pickerProvider
                                                                    .dateController,
                                                            readOnly: true,
                                                            decoration:
                                                                const InputDecoration(
                                                              labelText:
                                                                  "Date Picker",
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
                                                                borderSide:
                                                                    BorderSide(
                                                                        color:
                                                                            blackColor),
                                                              ),
                                                            ),
                                                            onTap: () {
                                                              // _selectDate();
                                                              pickerProvider
                                                                  .selectDate(
                                                                      context);
                                                            },
                                                          ),
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
                                                              width: 234.0 / 2,
                                                              child: TextField(
                                                                controller:
                                                                    pickerProvider
                                                                        .timeStartController,
                                                                readOnly: true,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  labelText:
                                                                      "Start Time",
                                                                  filled: true,
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
                                                                            color:
                                                                                blackColor),
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  // displayTimePicker(
                                                                  //     context);

                                                                  pickerProvider
                                                                      .displayTimePicker(
                                                                          context);
                                                                },
                                                              ),
                                                            ),
                                                            const SizedBox(
                                                                width: 10.0),
                                                            SizedBox(
                                                              height: 48.0,
                                                              width: 234.0 / 2,
                                                              child: TextField(
                                                                controller:
                                                                    pickerProvider
                                                                        .timeEndController,
                                                                readOnly: true,
                                                                decoration:
                                                                    const InputDecoration(
                                                                  labelText:
                                                                      "End Time",
                                                                  filled: true,
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
                                                                            color:
                                                                                blackColor),
                                                                  ),
                                                                ),
                                                                onTap: () {
                                                                  // displayTimePickerEnd(
                                                                  //     context);

                                                                  pickerProvider
                                                                      .displayTimePickerEnd(
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
                                                                          BorderRadius
                                                                              .all(
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
                                                  ],
                                                ),
                                              ),
                                              actions: <Widget>[
                                                TextButton(
                                                  child: const Text('Submit'),
                                                  onPressed: () {
                                                    var providerData = Provider
                                                        .of<PostDataDummyProvider>(
                                                            context,
                                                            listen: false);

                                                    PostDataDummyModel
                                                        dataModel =
                                                        PostDataDummyModel(
                                                      date: pickerProvider
                                                          .dateController.text,
                                                      timeStart: pickerProvider
                                                          .timeStartController
                                                          .text,
                                                      timeEnd: pickerProvider
                                                          .timeEndController
                                                          .text,
                                                      projectName:
                                                          _projectController
                                                              .text,
                                                      titleWorklog:
                                                          _titleController.text,
                                                      descriptionWorklog:
                                                          _descriptionController
                                                              .text,
                                                    );

                                                    providerData.addDataWorklog(
                                                        dataModel);

                                                    log(pickerProvider
                                                        .dateController.text);
                                                    log(pickerProvider
                                                        .timeEndController
                                                        .text);
                                                    log(pickerProvider
                                                        .timeStartController
                                                        .text);
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

                  // TODO: Daily worklog
                  Container(
                    height: 500,
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8.0),
                      ),
                      color: whiteColor,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 40.0),
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
                                      child: Consumer<PostDataDummyProvider>(
                                        builder:
                                            (context, valuePostData, child) {
                                          return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: valuePostData
                                                .dataWorklog.length,
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            padding: EdgeInsets.zero,
                                            itemBuilder: (context, indexCard) {
                                              return InkWell(
                                                onTap: () {
                                                  showDialog(
                                                    context: context,
                                                    builder: (context) {
                                                      return Center(
                                                        child: Container(
                                                          height: 600,
                                                          width: 600,
                                                          decoration:
                                                              const BoxDecoration(
                                                            color: whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  6.0),
                                                            ),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(30.0),
                                                            child: Column(
                                                              children: [
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      "Detail Task",
                                                                      style: myTextTheme.headlineSmall!.copyWith(
                                                                          fontSize:
                                                                              20.0,
                                                                          fontWeight:
                                                                              FontWeight.bold),
                                                                    ),
                                                                    IconButton(
                                                                      onPressed:
                                                                          () {},
                                                                      icon:
                                                                          const Icon(
                                                                        Icons
                                                                            .cancel_outlined,
                                                                        size:
                                                                            24.0,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .symmetric(
                                                                    vertical:
                                                                        20.0,
                                                                  ),
                                                                  child: Divider(
                                                                      color:
                                                                          blackColor),
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Text(
                                                                      valuePostData
                                                                          .dataWorklog[
                                                                              indexCard]
                                                                          .titleWorklog,
                                                                      style: myTextTheme
                                                                          .titleLarge!
                                                                          .copyWith(
                                                                              fontWeight: FontWeight.bold),
                                                                    ),
                                                                    Container(
                                                                      height:
                                                                          32,
                                                                      decoration: const BoxDecoration(
                                                                          color:
                                                                              thirdColor,
                                                                          borderRadius:
                                                                              BorderRadius.all(Radius.circular(10.0))),
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            const EdgeInsets.symmetric(horizontal: 18.0),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            const Icon(
                                                                              Icons.push_pin_outlined,
                                                                              size: 20.0,
                                                                            ),
                                                                            const SizedBox(width: 4.0),
                                                                            Text(
                                                                              valuePostData.dataWorklog[indexCard].projectName,
                                                                              style: myTextTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: const EdgeInsets
                                                                          .symmetric(
                                                                      vertical:
                                                                          16.0),
                                                                  child: Text(
                                                                    valuePostData
                                                                        .dataWorklog[
                                                                            indexCard]
                                                                        .descriptionWorklog,
                                                                    maxLines: 3,
                                                                    overflow:
                                                                        TextOverflow
                                                                            .ellipsis,
                                                                    style: myTextTheme.bodyMedium!.copyWith(
                                                                        fontSize:
                                                                            15.0,
                                                                        fontWeight:
                                                                            FontWeight.w500),
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Image.asset(
                                                                      "assets/images/logo_avatar.png",
                                                                      height:
                                                                          48.0,
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            15.0),
                                                                    Text(
                                                                      "Nama User",
                                                                      style: myTextTheme
                                                                          .bodyLarge!
                                                                          .copyWith(
                                                                              fontWeight: FontWeight.w600),
                                                                    ),
                                                                  ],
                                                                ),
                                                                const SizedBox(
                                                                    height:
                                                                        20.0),
                                                                Row(
                                                                  children: [
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Date",
                                                                          style: myTextTheme
                                                                              .bodyMedium!
                                                                              .copyWith(fontWeight: FontWeight.w600),
                                                                        ),
                                                                        Text(
                                                                          valuePostData
                                                                              .dataWorklog[indexCard]
                                                                              .date,
                                                                          style:
                                                                              myTextTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    const SizedBox(
                                                                        width:
                                                                            20.0),
                                                                    Column(
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Text(
                                                                          "Duration Hour",
                                                                          style: myTextTheme
                                                                              .bodyMedium!
                                                                              .copyWith(fontWeight: FontWeight.w600),
                                                                        ),
                                                                        Text(
                                                                          "${valuePostData.dataWorklog[indexCard].timeStart} - ${valuePostData.dataWorklog[indexCard].timeEnd}",
                                                                          style:
                                                                              myTextTheme.bodyMedium,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  );
                                                },
                                                child: Container(
                                                  width: 200,
                                                  color: yellowColor1,
                                                  margin: const EdgeInsets.only(
                                                      top: 10),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        const Expanded(
                                                          child: Icon(Icons
                                                              .check_circle_outline_outlined),
                                                        ),
                                                        const SizedBox(
                                                            width: 10.0),
                                                        Expanded(
                                                          flex: 4,
                                                          child: Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Text(
                                                                valuePostData
                                                                    .dataWorklog[
                                                                        indexCard]
                                                                    .projectName,
                                                                maxLines: 2,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                style: myTextTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w600),
                                                              ),
                                                              Text(
                                                                "${valuePostData.dataWorklog[indexCard].timeStart} - ${valuePostData.dataWorklog[indexCard].timeEnd}",
                                                                style: myTextTheme
                                                                    .bodyMedium!
                                                                    .copyWith(
                                                                        fontWeight:
                                                                            FontWeight.w400),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
