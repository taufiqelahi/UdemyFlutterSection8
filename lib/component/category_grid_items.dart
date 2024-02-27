import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/category.dart';
import 'package:udemy_flutter_section8/screen/meals_screen.dart';

class CategoryGridItems extends StatelessWidget {
  final Categories category;
  const CategoryGridItems({
    super.key,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: () {
        final filerteredlist =dummyMeals.where((element) => element.categories.contains(category.id)).toList();
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (_) =>
                    MealsScreen(title: category.title, meal: filerteredlist)));
      },
      child: Container(
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(colors: [
              category.color.withOpacity(0.6),
              category.color.withOpacity(0.9),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              category.title,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
