import 'package:flutter/material.dart';
import 'package:multiprovider/providers/bmi_provider.dart';
import 'package:multiprovider/providers/gender_provider.dart';
import 'package:multiprovider/providers/height_provider.dart';
import 'package:multiprovider/providers/weight_provider.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<HeightProvider>(
          create: (context) => HeightProvider(),
        ),
        ChangeNotifierProvider<WeightProvider>(
          create: (context) => WeightProvider(),
        ),
        ChangeNotifierProvider<GenderProvider>(
          create: (context) => GenderProvider(),
        ),
        ChangeNotifierProvider<BMIProvider>(
          create: (context) => BMIProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const HomePage(),
      ),
    );
  }
}
