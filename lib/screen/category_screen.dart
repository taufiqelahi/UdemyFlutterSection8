import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/component/category_grid_items.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/category.dart';
import 'package:udemy_flutter_section8/model/meals.dart';
import 'package:udemy_flutter_section8/screen/meals_screen.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.filterMeal});
  final List<Meal> filterMeal;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  @override
  void initState() {
    // TODO: implement initState
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    super.initState();
    animationController.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    animationController.dispose();
  }

  void onSeleted(
      {required BuildContext context, required Categories category}) {
    final filerteredlist = widget.filterMeal
        .where((element) => element.categories.contains(category.id))
        .toList();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (_) => MealsScreen(
                  title: category.title,
                  meal: filerteredlist,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      child: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1.2,
          mainAxisSpacing: 12,
          crossAxisSpacing: 12,
        ),
        children: availableCategories
            .map((e) => CategoryGridItems(
                  category: e,
                  onPressed: () {
                    onSeleted(context: context, category: e);
                  },
                ))
            .toList(),
      ),
      builder: (BuildContext context, child) {
        return ScaleTransition(
          scale: Tween(begin: 0.1, end: 1.0).animate(
           CurvedAnimation(parent: animationController, curve: Curves.easeInOutCubicEmphasized)
              ),
          child: child,
        );
      },
    );
  }
}
