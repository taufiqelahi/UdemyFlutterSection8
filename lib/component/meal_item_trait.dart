import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
     Icon(icon,color:Colors.white,size: 17,),
        const SizedBox(width: 6,),
        Text(text,style: const TextStyle(color: Colors.white),)
      ],
    );
  }
}
