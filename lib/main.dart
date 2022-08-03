import 'package:flutter/material.dart';
import 'features/gif_navigator/presentation/pages/WelcomePage.dart';
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
      home: WelcomePage()
    );
  }
}



