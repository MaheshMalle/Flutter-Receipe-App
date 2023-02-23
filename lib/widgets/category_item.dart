import 'package:flutter/material.dart';
import 'package:receipe/screens/categoires_meals.dart';
import 'package:receipe/screens/categories_screen.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  const CategoryItem(
      {required this.id, required this.title, required this.color});

  void selectCategory(BuildContext context) {
    Navigator.of(context).pushNamed('/category-meals', arguments: {
      'id': id,
      'title': title,
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            color.withOpacity(0.25),
            color.withOpacity(0.5),
            color.withOpacity(0.75),
            color,
          ], begin: Alignment.bottomLeft, end: Alignment.topRight),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      onTap: () {
        selectCategory(context);
      },
    );
  }
}
