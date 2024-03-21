import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section8/provider/meals_provider.dart';

enum Filter { gulten, lactose, vegetarian, vegan }

final filterProvider = StateNotifierProvider<FilterNotifier, Map<Filter, bool>>(
    (ref) => FilterNotifier());

class FilterNotifier extends StateNotifier<Map<Filter, bool>> {
  FilterNotifier()
      : super({
          Filter.gulten: false,
          Filter.lactose: false,
          Filter.vegetarian: false,
          Filter.vegan: false
        });
  void setFilters(Map<Filter, bool> filter) {
    state = filter;
  }

  void setFilter({required Filter filter, required bool value}) {
    state = {...state, filter: value};
  }
}

final filterMealsProvider = Provider((ref) {
  final meals = ref.watch(mealProvider);
  final activeFilter = ref.watch(filterProvider);
  return meals.where((element) {
    if (activeFilter[Filter.gulten]! && !element.isGlutenFree) {
      return false;
    }
    if (activeFilter[Filter.lactose]! && !element.isLactoseFree) {
      return false;
    }
    if (activeFilter[Filter.vegetarian]! && !element.isVegetarian) {
      return false;
    }
    if (activeFilter[Filter.vegan]! && !element.isVegan) return false;

    return true;
  }).toList();
});
