import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section8/model/meals.dart';

final favouriteMealProvider=StateNotifierProvider<FavouriteProvider,List<Meal>>((ref) =>FavouriteProvider() );
class FavouriteProvider extends StateNotifier<List<Meal>>{
  FavouriteProvider():super([]);

  bool favouriteMeal({required Meal meal,}){
    final isExisted=state.contains(meal);

    if(isExisted){
      int index=state.indexWhere((element) => element.id==meal.id);
      state.removeAt(index);
      state=[...state];
      return false;

    }else{
      state=[...state,meal];
      return true;
    }
  }



}