import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key, required this.onChanged});
  final void Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return  Drawer(
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
              onTap: (){
                onChanged('meals');
              },
              leading: const Icon(Icons.restaurant,size: 26,color: Colors.black,),
              title: const Text('Meals',style: TextStyle(fontSize: 24),),
            ),
            ListTile(
              onTap: (){
                onChanged('filter');
              },
              leading: const Icon(Icons.settings,size: 26,color: Colors.black,),
              title: const Text('Settings',style: TextStyle(fontSize: 24),),
            )
          ],
        ));
  }
}
