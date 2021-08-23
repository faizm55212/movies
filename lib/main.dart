import 'package:flutter/material.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:movies/controllers/movies_controller.dart';
import 'package:movies/controllers/user_controller.dart';
import 'package:movies/models/user.dart';
import 'package:path_provider/path_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'screens/login.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('users');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final userController = Get.put<UserController>(UserController());
    // ignore: unused_local_variable
    final movieController = Get.put<MovieController>(MovieController());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoginPage(),
    );
  }
}
