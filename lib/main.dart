import 'package:flutter/material.dart';
import 'package:flutter_worklog/data/provider/login_provider.dart';
import 'package:flutter_worklog/ui/home_screen/home_screen.dart';
import 'package:flutter_worklog/ui/login_screen/login_screen.dart';
import 'package:provider/provider.dart';

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
          create: (context) => LoginProvider(),
        ),
        // ChangeNotifierProvider(
        //   create: (context) => LoginProvider(),
        // ),
      ],
      child: MaterialApp(
        title: 'WorkLog App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        // home: const LoginScreen(),
        home: const HomeScreen(),
      ),
    );
  }
}
