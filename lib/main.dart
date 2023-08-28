import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/pages/create_page.dart';

import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/pages/main_page.dart';
import 'package:patterns_getx/pages/update_page.dart';
import 'package:patterns_getx/services/bind_service.dart';
import 'package:patterns_getx/services/di_service.dart';

void main() async {
  await DIService.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      // initialBinding: BindService(),
      // getPages: [
      //   GetPage(
      //     name: MainPage.id,
      //     page: () => const MainPage(),
      //     binding: BindService(),
      //   ),
      // ],
      routes: {
        HomePage.id: (context) => const HomePage(),
        MainPage.id: (context) => const MainPage(),
        CreatePage.id: (context) => const CreatePage(),
        UpdatePage.id: (context) => const UpdatePage(),
      },
    );
  }
}
