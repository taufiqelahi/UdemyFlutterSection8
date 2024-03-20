import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section8/data/dummy_data.dart';
import 'package:udemy_flutter_section8/model/meals.dart';

final mealProvider=Provider<List<Meal>>((ref){
  return dummyMeals;
});