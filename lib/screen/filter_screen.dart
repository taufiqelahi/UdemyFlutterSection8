import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: value,
            onChanged: (isSelected) {
              setState(() {
                value = isSelected;
              });
            },
            title: const Text(
              'Gulten-free',
              style: TextStyle(fontSize: 24),
            ),
            subtitle: Text(
              'no longer free are not ',
              style: TextStyle(fontSize: 16),
            ),
            contentPadding: EdgeInsets.all(20),
            activeColor: Colors.green.withOpacity(.8),
            activeTrackColor: Colors.black54,
          )
        ],
      ),
    );
  }
}
