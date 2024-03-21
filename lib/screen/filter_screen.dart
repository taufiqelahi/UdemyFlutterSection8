import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:udemy_flutter_section8/provider/filter_meal_provider.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilter = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filter'),
      ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilter[Filter.gulten]!,
            onChanged: (isSelected) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter: Filter.gulten, value: isSelected);
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
            value: activeFilter[Filter.lactose]!,
            onChanged: (isSelected) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter: Filter.lactose, value: isSelected);
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
            value: activeFilter[Filter.vegetarian]!,
            onChanged: (isSelected) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter: Filter.vegetarian, value: isSelected);
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
            value: activeFilter[Filter.vegan]!,
            onChanged: (isSelected) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(filter: Filter.vegan, value: isSelected);
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
