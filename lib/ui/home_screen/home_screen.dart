import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/provider/get_data_worklog_provider.dart';
import 'package:flutter_worklog/data/provider/picker_provider.dart';
import 'package:flutter_worklog/utils/enum.dart';
import 'package:flutter_worklog/utils/styles.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../data/provider/detail_task_provider.dart';
import '../../data/provider/post_worklog_provider.dart';
import '../../widgets/widget_appbar_homescreen.dart';
import '../../widgets/widget_container_filter.dart';
import '../../widgets/widget_current_date.dart';
import '../../widgets/widget_detail_sisa_hour.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    required this.userId,
    required this.username,
    required this.fullName,
  });
  // const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();

  final int userId;
  final String username;
  final String fullName;
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

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      // Get Data worklog all
      Provider.of<DataWorklogProvider>(context, listen: false)
          .initializeWorklogs(widget.userId);

      // Get project dropdown at create task
      Provider.of<DetailTaskProvider>(context, listen: false)
          .getDataDetail(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    // for looping project dropdown
    var dataProjects = Provider.of<DetailTaskProvider>(context).hasilDetailTask;

    final int userId = widget.userId;
    final String username = widget.username;
    final String fullName = widget.fullName;

    // provider to post data
    final postData =
        Provider.of<PostDataWorklogProvider>(context, listen: false);

    return Scaffold(
      backgroundColor: forthColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            AppbarHomePage(fullName: fullName),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 100.0, vertical: 50.0),
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      children: [
                        const WidgetCurrentDate(),
                        const SizedBox(width: 4.0),
                        WidgetContainerFilter(context),
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
                                  const WidgetDetailSisaHour(),
                                  Expanded(
                                    child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: primaryColor,
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
                                              backgroundColor: whiteColor,
                                              content: SingleChildScrollView(
                                                child: Column(
                                                  children: [
                                                    // TODO: Datepicker, Start Time, End Time
                                                    Row(
                                                      children: [
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
                                                              pickerProvider
                                                                  .selectDate(
                                                                      context);
                                                            },
                                                          ),
                                                        ),
                                                        const SizedBox(
                                                            width: 10.0),
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
                                                      dropdownMenuEntries:
                                                          dataProjects!.projects
                                                              .map((index) =>
                                                                  DropdownMenuEntry(
                                                                    label: index
                                                                        .projectName,
                                                                    value: index
                                                                        .projectId,
                                                                  ))
                                                              .toList(),
                                                      onSelected: (value) {
                                                        // Restore the value to the controller
                                                        _projectController
                                                                .text =
                                                            value.toString();
                                                      },
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
                                                  child: Text(
                                                    'Submit',
                                                    style:
                                                        myTextTheme.bodySmall,
                                                  ),
                                                  onPressed: () async {
                                                    if (_formKey.currentState!
                                                        .validate()) {
                                                      await postData
                                                          .postDataWorklog(
                                                        logDate: pickerProvider
                                                            .dateController
                                                            .text,
                                                        logStart: pickerProvider
                                                            .timeStartController
                                                            .text,
                                                        logEnd: pickerProvider
                                                            .timeEndController
                                                            .text,
                                                        logDetails:
                                                            _descriptionController
                                                                .text,
                                                        userId: userId,
                                                        projectId: int.tryParse(
                                                            _projectController
                                                                .text)!,
                                                        logTitle:
                                                            _titleController
                                                                .text,
                                                      );

                                                      Navigator
                                                          .pushAndRemoveUntil(
                                                              context,
                                                              MaterialPageRoute(
                                                        builder: (context) {
                                                          return HomeScreen(
                                                            userId: userId,
                                                            username: username,
                                                            fullName: fullName,
                                                          );
                                                        },
                                                      ), (route) => false);
                                                    }
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
                      padding: const EdgeInsets.all(
                        10.0,
                      ),
                      child: Consumer<DataWorklogProvider>(
                        builder: (context, valueDataWorklog, child) {
                          Map<String, List<dynamic>> groupedWorklogs =
                              valueDataWorklog.groupedWorklogs;

                          if (valueDataWorklog.state == ResultState.isLoading) {
                            return const CircularProgressIndicator.adaptive();
                          } else if (valueDataWorklog.state ==
                              ResultState.hasData) {
                            return ListView.builder(
                              itemCount: groupedWorklogs.length,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              padding: EdgeInsets.zero,
                              itemBuilder: (context, indexDay) {
                                String date =
                                    groupedWorklogs.keys.elementAt(indexDay);
                                String dateWithoutTime = date.substring(
                                    0, 10); // Extract the first 10 characters

                                DateTime parsedDate =
                                    DateTime.parse(dateWithoutTime);
                                String fullDayName =
                                    DateFormat('EEEE').format(parsedDate);

                                List<dynamic> logs = groupedWorklogs[date]!;
                                return Container(
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: thirdColor, width: 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20.0),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        children: [
                                          Text(fullDayName),
                                          SizedBox(
                                            width: 200.0,
                                            child: ListView.builder(
                                              shrinkWrap: true,
                                              itemCount: logs.length,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              padding: EdgeInsets.zero,
                                              itemBuilder:
                                                  (context, indexCard) {
                                                return InkWell(
                                                  onTap: () {
                                                    showDialog(
                                                      context: context,
                                                      builder: (context) {
                                                        return Center(
                                                          child: Container(
                                                            height: 500,
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
                                                                          .all(
                                                                      30.0),
                                                              child: Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  const WidgetAppbarDetailWorklog(),
                                                                  const Padding(
                                                                    padding:
                                                                        EdgeInsets
                                                                            .symmetric(
                                                                      vertical:
                                                                          16.0,
                                                                    ),
                                                                    child: Divider(
                                                                        color:
                                                                            greyColor2),
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceBetween,
                                                                    children: [
                                                                      Text(
                                                                        logs[indexCard]
                                                                            [
                                                                            "logTitle"],
                                                                        style: myTextTheme
                                                                            .titleLarge!
                                                                            .copyWith(fontWeight: FontWeight.bold),
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
                                                                              Image.asset(
                                                                                "assets/images/logo_project.png",
                                                                              ),
                                                                              const SizedBox(width: 4.0),
                                                                              Text(
                                                                                logs[indexCard]["project"]["projectName"],
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
                                                                      logs[indexCard]
                                                                          [
                                                                          "logDetails"],
                                                                      maxLines:
                                                                          3,
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
                                                                      Image
                                                                          .asset(
                                                                        "assets/images/logo_avatar.png",
                                                                        height:
                                                                            48.0,
                                                                      ),
                                                                      const SizedBox(
                                                                          width:
                                                                              15.0),
                                                                      Text(
                                                                        fullName,
                                                                        style: myTextTheme
                                                                            .bodyLarge!
                                                                            .copyWith(fontWeight: FontWeight.w600),
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Date",
                                                                            style:
                                                                                myTextTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                                                                          ),
                                                                          const SizedBox(
                                                                              height: 16.0),
                                                                          Text(
                                                                            logs[indexCard]["logDate"],
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
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Text(
                                                                            "Duration Hour",
                                                                            style:
                                                                                myTextTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w600),
                                                                          ),
                                                                          const SizedBox(
                                                                              height: 16.0),
                                                                          Text(
                                                                            "${logs[indexCard]["logStart"]} - ${logs[indexCard]["logEnd"]}",
                                                                            style:
                                                                                myTextTheme.bodyMedium,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  const SizedBox(
                                                                      height:
                                                                          20.0),
                                                                  Container(
                                                                    height:
                                                                        95.0,
                                                                    width: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width,
                                                                    decoration:
                                                                        const BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            20.0),
                                                                      ),
                                                                      color:
                                                                          thirdColor,
                                                                    ),
                                                                    child: ListView
                                                                        .builder(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .zero,
                                                                      itemCount:
                                                                          logs[indexCard]["project"]["collaboration"]
                                                                              .length,
                                                                      shrinkWrap:
                                                                          true,
                                                                      itemBuilder:
                                                                          (context,
                                                                              indexCollab) {
                                                                        return Padding(
                                                                          padding: const EdgeInsets.symmetric(
                                                                              horizontal: 20.0,
                                                                              vertical: 5.0),
                                                                          child:
                                                                              Container(
                                                                            decoration:
                                                                                const BoxDecoration(
                                                                              color: redColor1,
                                                                              borderRadius: BorderRadius.all(
                                                                                Radius.circular(20.0),
                                                                              ),
                                                                            ),
                                                                            child:
                                                                                Center(
                                                                              child: Text(logs[indexCard]["project"]["collaboration"][indexCollab], style: myTextTheme.bodyMedium!.copyWith(color: whiteColor)),
                                                                            ),
                                                                          ),
                                                                        );
                                                                      },
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
                                                  child: Container(
                                                    width: 200,
                                                    decoration:
                                                        const BoxDecoration(
                                                            color: yellowColor1,
                                                            boxShadow: [
                                                          BoxShadow(
                                                              color: blackColor)
                                                        ]),
                                                    margin:
                                                        const EdgeInsets.only(
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
                                                                  logs[indexCard]
                                                                      [
                                                                      "logTitle"],
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
                                                                  "${logs[indexCard]["logStart"]} - ${logs[indexCard]["logEnd"]}",
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
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (valueDataWorklog.state ==
                              ResultState.noData) {
                            return const Center(child: Text("No Data"));
                          } else {
                            return const Center(child: Text("No Data"));
                          }
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
    );
  }
}

class WidgetAppbarDetailWorklog extends StatelessWidget {
  const WidgetAppbarDetailWorklog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Detail Task",
          style: myTextTheme.headlineSmall!
              .copyWith(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.cancel_outlined,
            size: 24.0,
          ),
        ),
      ],
    );
  }
}
