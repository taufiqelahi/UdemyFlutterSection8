import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section8/model/meals.dart';

final favouriteMealProvider=StateNotifierProvider<FavouriteProvider,List<Meal>>((ref) =>FavouriteProvider() );
class FavouriteProvider extends StateNotifier<List<Meal>>{
  FavouriteProvider():super([]);

  void favouriteMeal({required Meal meal,required BuildContext context}){
    final isExisted=state.contains(meal);

    if(isExisted){
      state=state.where((element) => element.id!=meal.id).toList();
_showInfoMessage('remove meals', context);
    }else{
      state=[...state,meal];
      _showInfoMessage('Added to favourite meals', context);
    }
  }
  void _showInfoMessage(String s,BuildContext context) {
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 1),
        content: Text(s),
      ),
    );
  }


}