import 'package:flutter/material.dart';
import 'package:national_id/ui/home_screen/screen/home_screen.dart';

main ()
{
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
      ),
      home: const HomeScreen(),
    );
  }
}

