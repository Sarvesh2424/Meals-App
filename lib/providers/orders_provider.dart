import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class OrderedMealsNotifier extends StateNotifier<List<Meal>> {
  OrderedMealsNotifier() : super([]);

  bool addOrder(Meal meal) {
    final mealIsOrdered = state.contains(meal);

    if (mealIsOrdered) {
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final orderedMealsProvider =
    StateNotifierProvider<OrderedMealsNotifier, List<Meal>>((ref) {
  return OrderedMealsNotifier();
});
