import 'package:flutter/material.dart';
import 'package:uptodo/screens/onboarding/spalsh.dart';
import 'package:uptodo/utils/theme_data.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // await initializeDependencies();
  // await getIt.allReady();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: UpToDoTheme.themeData(),
      debugShowCheckedModeBanner: false,
      home: const Splash(),
    );
  }
}
