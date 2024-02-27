import 'package:flutter/material.dart';
import 'package:udemy_flutter_section8/model/meals.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meal});
  final String title;
  final List<Meal>meal;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body:ListView(
        children: meal.map((e) => Column(
          children: [
            Text(e.title),
            Image.network(e.imageUrl)
          ],
        )).toList(),
      )
    );
  }
}
