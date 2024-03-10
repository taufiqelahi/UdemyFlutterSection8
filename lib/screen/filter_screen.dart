import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool gultenFilter = false;
  bool lactoseFilter = false;
  bool vegetarianFilter=false;
  bool veganFilter=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: gultenFilter,
            onChanged: (isSelected) {
              setState(() {
                gultenFilter = isSelected;
              });
            },
            title: const Text(
              'Gulten-free',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: const Text(
              'Only Gulten-free meals',
              style: TextStyle(fontSize: 16),
            ),
            contentPadding: const EdgeInsets.all(20),
            activeColor: Colors.green.withOpacity(.8),
            activeTrackColor: Colors.black54,
          ),
          SwitchListTile(
            value: lactoseFilter,
            onChanged: (isSelected) {
              setState(() {
                lactoseFilter = isSelected;
              });
            },
            title: const Text(
              'Lactose-free',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: const Text(
              'Only Lactose-free meals',
              style: TextStyle(fontSize: 16),
            ),
            contentPadding: const EdgeInsets.all(20),
            activeColor: Colors.green.withOpacity(.8),
            activeTrackColor: Colors.black54,
          ),
          SwitchListTile(
            value: vegetarianFilter,
            onChanged: (isSelected) {
              setState(() {
                vegetarianFilter = isSelected;
              });
            },
            title: const Text(
              'Vegetarian',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: const Text(
              'Only Vegetarian meals',
              style: TextStyle(fontSize: 16),
            ),
            contentPadding: const EdgeInsets.all(20),
            activeColor: Colors.green.withOpacity(.8),
            activeTrackColor: Colors.black54,
          ),
          SwitchListTile(
            value: veganFilter,
            onChanged: (isSelected) {
              setState(() {
                veganFilter = isSelected;
              });
            },
            title: const Text(
              'Vegan',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: const Text(
              'Only Vegan meals',
              style: TextStyle(fontSize: 16),
            ),
            contentPadding: const EdgeInsets.all(20),
            activeColor: Colors.green.withOpacity(.8),
            activeTrackColor: Colors.black54,
          )
        ],
      ),
    );
  }
}
