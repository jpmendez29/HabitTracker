import 'dart:developer';

import 'package:get/get.dart';


import 'package:habbit_tracker/domain/entities/Habit.dart';

import '../../data/habitDataController.dart';



class addHabit {
  // Habit habit;
  final HabitDataController dataController = Get.find();
  saveHabit(Habit newHabit) {
    dataController.addHabit(newHabit);
  }

  deleteHabit(String name) {
    dataController.deleteHabit(name);
  }
}
