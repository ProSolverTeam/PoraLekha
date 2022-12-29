import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pora_lekha/QuestionScreen/QuestionScreen_bindings.dart';
import 'package:pora_lekha/pages/home.dart';
import 'package:pora_lekha/pages/student_list_screen.dart';
import 'firebase_options.dart';
import 'pages/UserListPage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(GetMaterialApp(
    theme: customTheme,
    title: 'Flutter Demo',
    home: const MyHomePage(),
    initialRoute: '/home',
    getPages: [
      GetPage(
          name: '/home',
          page: () => const MyHomePage(),
          binding: QuestionScreenBindings()),
      GetPage(
          name: '/user-list-page',
          page: () => const UserListPage(),
          binding: QuestionScreenBindings()),
      GetPage(
          name: '/student-list-screen',
          page: () => const StudentListScreen(),
          binding: QuestionScreenBindings()),
    ],
  ));
}
