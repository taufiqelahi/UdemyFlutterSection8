import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/component/category_grid_items.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/category.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        children: availableCategories
            .map((e) => CategoryGridItems(category: e,))
            .toList(),
      ),
    );
  }
}

