import 'package:get/get.dart';
import 'package:habbit_tracker/data/habitDataController.dart';
import 'package:habbit_tracker/domain/entities/Habit.dart';

class addHabit {
  // Habit habit;
  HabitDataController dataController = Get.find();
  saveHabit(Habit newHabit) {
    dataController.addHabit(newHabit);
  }

  deleteHabit(String name) {
    dataController.deleteHabit(name);
  }
}
