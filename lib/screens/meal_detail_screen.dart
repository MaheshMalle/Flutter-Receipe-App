import 'package:flutter/material.dart';
import 'package:receipe/dummy-data.dart';

class MealDetailScreen extends StatelessWidget {
  final String mealId;

  const MealDetailScreen({super.key, required this.mealId});

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 200,
      width: 300,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => mealId == meal.id);
    return Scaffold(
        appBar: AppBar(
          title: Text("Meals section"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
              buildSectionTitle(context, 'Ingredients'),
              buildContainer(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle(context, 'Steps'),
              buildContainer(ListView.builder(
                itemBuilder: (context, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('#${(index + 1)}'),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    Divider()
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ))
            ],
          ),
        ));
  }
}
