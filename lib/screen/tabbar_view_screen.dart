import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/model/meals.dart';
import 'package:udemy_flutter_section8/screen/category_screen.dart';
import 'package:udemy_flutter_section8/screen/meals_screen.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen> {
  List<Meal> favouriteMeals = [];
  void favouriteMeal(Meal meal) {
    final isExisting = favouriteMeals.contains(meal);
    print(isExisting);

    if (isExisting) {
      setState(() {
        favouriteMeals.remove(meal);
      });
      _showInfoMessage('Meal is no longer a favorite.');
    } else {
      setState(() {
        favouriteMeals.add(meal);
        _showInfoMessage('Marked as a favorite!');
      });
    }
  }

  void _showInfoMessage(String s) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(s),
      ),
    );
  }

  int index = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      CategoryScreen(
        onPressed: favouriteMeal,
      ),
      MealsScreen(
        title: 'Favourite',
        meal: favouriteMeals,
        onPreesed: favouriteMeal,
      )
    ];

    return Scaffold(
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
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favourite')
        ],
      ),
    );
  }
}
