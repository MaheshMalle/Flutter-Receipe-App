import 'package:flutter/material.dart';
import 'package:receipe/screens/categoires_meals.dart';
import 'package:receipe/screens/tabsScreen.dart';
import 'package:receipe/screens/tabs_screen_down.dart';
import '../screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "receipe",
      home: TabsScreenDown(),
      routes: {
        '/category-meals': (context) => CategoryMealsScreen(),
      },
    );
  }
}
