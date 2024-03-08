import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:udemy_flutter_section8/model/meals.dart';

class MealsDetailsScreen extends StatelessWidget {
  const MealsDetailsScreen({super.key, required this.meal});
  final Meal meal;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text(meal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            FadeInImage(
                placeholder: MemoryImage(kTransparentImage),
                image: NetworkImage(meal.imageUrl)),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Ingredients',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.ingredients
                .map((e) => Text(
                      e,
                      textAlign: TextAlign.center,
                    ))
                .toList(),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Steps',
              style: TextStyle(
                  color: Colors.orange,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            ...meal.steps.map((e) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Text(
                    e,
                    textAlign: TextAlign.center,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
