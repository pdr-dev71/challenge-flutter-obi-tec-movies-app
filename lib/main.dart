import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movies_go/core/bindings/application_bindings.dart';
import 'package:movies_go/core/ui/movies_go_app_ui_config.dart';
import 'package:movies_go/router/router_navigation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  FirebaseRemoteConfig.instance.fetchAndActivate();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: FilmesAppUiConfig.theme,
      initialRoute: AppRouter.splash,
      debugShowCheckedModeBanner: false,
      initialBinding: ApplicationBindings(),
      getPages: AppRouter.pages,
    );
  }
}
