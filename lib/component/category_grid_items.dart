import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/category.dart';
import 'package:udemy_flutter_section8/model/meals.dart';
import 'package:udemy_flutter_section8/screen/meals_screen.dart';

class CategoryGridItems extends StatelessWidget {
  final Categories category;
  final void Function() onPressed;
  const CategoryGridItems({
    super.key,
    required this.category, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap:onPressed,
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
