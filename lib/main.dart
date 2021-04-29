import 'package:exam_1/screens/add_car_screen.dart';
import 'package:exam_1/screens/details_car_screen.dart';
import 'package:exam_1/screens/edit_car_screen.dart';
import 'package:flutter/material.dart';

import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Car App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.lightBlue,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.blueAccent),
          ),
        ),
      ),
      home: HomeScreen(),
      routes: {
        DetailsCarScreen.routeName: (ctx) => DetailsCarScreen(),
        AddCarScreen.routeName: (ctx) => AddCarScreen(),
        EditCarScreen.routeName: (ctx) => EditCarScreen(),
      },
    );
  }
}

