import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:poc_remote_config/firebase_options.dart';
import 'package:poc_remote_config/pages/home.dart';
import 'package:poc_remote_config/remote_config/custom_remote_config.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await CustomRemoteConfig().initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const HomePage(),
    );
  }
}
