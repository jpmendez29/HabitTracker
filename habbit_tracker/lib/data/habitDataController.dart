import 'package:get/get.dart';

import '../domain/entities/Habit.dart';

class HabitDataController extends GetxController {
  List<Habit> myHabits = <Habit>[].obs;

  addHabit(Habit newHabit) {
    print(
        " Pruebaa de habito en dataController: ${newHabit.name} ${newHabit.color} ${newHabit.icon} ${newHabit.reminders[0]} ${newHabit.initDate.day.toString()} ${newHabit.goal} ${newHabit.intervalOfDays} ");
    myHabits.add(newHabit);
  }

  deleteHabit(String name) {
    myHabits.removeWhere((currentHabit) => currentHabit.name == name);
  }
}
