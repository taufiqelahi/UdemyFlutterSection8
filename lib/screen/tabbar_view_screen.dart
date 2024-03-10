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
        meal: favouriteMeals,
        onPreesed: favouriteMeal,
      )
    ];

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(index == 0 ? 'Categories' : 'Favourite'),
      ),
      drawer: Drawer(
          child: Column(
        children: [
          DrawerHeader(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Colors.deepOrangeAccent,
                  Colors.deepOrangeAccent.withOpacity(.8),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )),
              child: const Row(
                children: [
                  Icon(
                    Icons.fastfood,
                    size: 48,
                    color: Colors.black54,
                  ),
                  SizedBox(
                    width: 18,
                  ),
                  Text(
                    'Cooking up!',
                    style: TextStyle(color: Colors.black54),
                  )
                ],
              )),
         ListTile(
            onTap: (){},
            leading: const Icon(Icons.restaurant,size: 26,color: Colors.black,),
            title: const Text('Meals',style: TextStyle(fontSize: 24),),
          ),
          ListTile(
            onTap: (){},
            leading: const Icon(Icons.settings,size: 26,color: Colors.black,),
            title: const Text('Settings',style: TextStyle(fontSize: 24),),
          )
        ],
      )),
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
          const BottomNavigationBarItem(
              icon: Icon(Icons.set_meal), label: 'Categories'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.star), label: 'Favourite')
        ],
      ),
    );
  }
}
