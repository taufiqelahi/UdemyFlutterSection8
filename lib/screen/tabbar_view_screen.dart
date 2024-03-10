import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/component/drawer_screen.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/meals.dart';
import 'package:udemy_flutter_section8/screen/category_screen.dart';
import 'package:udemy_flutter_section8/screen/filter_screen.dart';
import 'package:udemy_flutter_section8/screen/meals_screen.dart';

class TabBarViewScreen extends StatefulWidget {
  const TabBarViewScreen({super.key});

  @override
  State<TabBarViewScreen> createState() => _TabBarViewScreenState();
}

class _TabBarViewScreenState extends State<TabBarViewScreen> {
  List<Meal> favouriteMeals = [];
  Map<Filter,bool>selectedItems={
    Filter.gulten:false,
    Filter.lactose:false,
    Filter.vegetarian:false,
    Filter.vegan:false,


  };
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
  void setValue(String value) async{
    Navigator.pop(context);
    if (value == 'filter') {
    final result=await  Navigator.push<Map<Filter,bool>>(
          context, MaterialPageRoute(builder: (_) => FilterScreen()));

   setState(() {
     selectedItems=result!;
   });
    }
  }

  @override
  Widget build(BuildContext context) {
final filteredMeals=dummyMeals.where((element) {
  if(selectedItems[Filter.gulten]!&&!element.isGlutenFree) {

    return false;
  }
  if(selectedItems[Filter.lactose]!&&!element.isLactoseFree )return false;
  if(selectedItems[Filter.vegetarian]!&&!element.isVegetarian) return false;
  if(selectedItems[Filter.vegan]!&&!element.isVegan) return false;
return true;


}).toList();

    List<Widget> widgets = [
      CategoryScreen(
        onPressed: favouriteMeal, filterMeal:filteredMeals,
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
