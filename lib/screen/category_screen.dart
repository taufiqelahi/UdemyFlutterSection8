import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/component/category_grid_items.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/category.dart';
import 'package:udemy_flutter_section8/model/meals.dart';
import 'package:udemy_flutter_section8/screen/meals_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key, required this.onPressed, required this.filterMeal});
  final void Function(Meal meal) onPressed;
  final List<Meal> filterMeal;
  void onSeleted({required BuildContext context, required Categories category}){
    final filerteredlist = filterMeal
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) =>
                MealsScreen(title: category.title, meal: filerteredlist, onPreesed:onPressed )));
  }
  @override
  Widget build(BuildContext context) {
    return  GridView(
      padding: const EdgeInsets.all(20),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
      ),
      children: availableCategories
          .map((e) => CategoryGridItems(category: e, onPressed: (){
            onSeleted(context: context, category:e );
      },))
          .toList(),
    );
  }
}

