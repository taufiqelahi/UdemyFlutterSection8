import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/model/category.dart';

class CategoryGridItems extends StatelessWidget {
  final Categories category;
  const CategoryGridItems({
    super.key, required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: category.color,
      child: Column(
        children: [
          Text(category.id),
          Text(category.title),
        ],
      ),
    );
  }
}
