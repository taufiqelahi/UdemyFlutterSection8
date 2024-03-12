import 'package:flutter/material.dart';

enum Filter { gulten, lactose, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key, required this.currentFiltered});
final Map<Filter,bool> currentFiltered;
  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  bool gultenFilter = false;
  bool lactoseFilter = false;
  bool vegetarianFilter = false;
  bool veganFilter = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    gultenFilter=widget.currentFiltered[Filter.gulten]!;
    lactoseFilter=widget.currentFiltered[Filter.lactose]!;
    vegetarianFilter=widget.currentFiltered[Filter.vegetarian]!;
    veganFilter=widget.currentFiltered[Filter.vegan]!;


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (d) async {
          if (d) return;
          Navigator.of(context).pop({
            Filter.gulten: gultenFilter,
            Filter.lactose: lactoseFilter,
            Filter.vegetarian: vegetarianFilter,
            Filter.vegan: veganFilter
          });
        },
        child: Column(
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
      ),
    );
  }
}
