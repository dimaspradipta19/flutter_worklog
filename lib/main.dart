import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/provider/get_data_worklog_provider.dart';
import 'package:flutter_worklog/data/provider/picker_provider.dart';
import 'package:flutter_worklog/data/provider/post_worklog_provider.dart';
import 'package:flutter_worklog/ui/home_screen/home_screen.dart';
import 'package:flutter_worklog/ui/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

import 'data/provider/detail_task_provider.dart';
import 'data/provider/login_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PostLoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => DetailTaskProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PickerProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => PostDataDummyProvider(),
        // ),
        ChangeNotifierProvider(
          create: (context) => DataWorklogProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => PostDataWorklogProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'WorkLog App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: const LoginScreen(),
        // home: const HomeScreen(),
      ),
    );
  }
}
