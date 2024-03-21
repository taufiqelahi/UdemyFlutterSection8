import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section8/component/drawer_screen.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/meals.dart';
import 'package:udemy_flutter_section8/provider/favourite_meal_provider.dart';
import 'package:udemy_flutter_section8/provider/filter_meal_provider.dart';
import 'package:udemy_flutter_section8/provider/meals_provider.dart';
import 'package:udemy_flutter_section8/screen/category_screen.dart';
import 'package:udemy_flutter_section8/screen/filter_screen.dart';
import 'package:udemy_flutter_section8/screen/meals_screen.dart';

class TabBarViewScreen extends ConsumerStatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  ConsumerState<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends ConsumerState<TabBarViewScreen> {
  int index = 0;
  void setValue(String value) async {
    Navigator.pop(context);
    if (value == 'filter') {
      await Navigator.push<Map<Filter, bool>>(
          context, MaterialPageRoute(builder: (_) => FilterScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final favouriteMeals = ref.watch(favouriteMealProvider);
    final filteredMeals = ref.watch(filterMealsProvider);

    List<Widget> widgets = [
      CategoryScreen(
        filterMeal: filteredMeals,
      ),
      MealsScreen(
        meal: favouriteMeals,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(index == 0 ? 'Categories' : 'Favourite'),
      ),
      drawer: DrawerScreen(
        onChanged: setValue,
      ),
      body: Center(
        child: widgets.elementAt(index),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (i) {
          setState(() {
            index = i;
          });
        },
        currentIndex: index,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favourite')
        ],
      ),
    );
  }
}
