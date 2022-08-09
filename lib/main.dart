import 'package:flutter/material.dart';
import 'features/login/presentation/pages/LoginPage.dart';
import 'injection_container.dart' as di;

Future<void> main() async {
  runApp(const MyApp());
  await di.init();
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: LoginPage()
    );
  }
}



