import 'dart:ui';

import 'package:get/get.dart';
import 'package:habbit_tracker/domain/entities/Habit.dart';
import 'package:habbit_tracker/domain/use_cases/addHabit.dart';
import 'package:habbit_tracker/utils/HabitIcons.dart';
import 'package:habbit_tracker/utils/colorConverter.dart';

class HabitController extends GetxController {
  addHabit habitUseCase;
  List<Color> btnColors = List.filled(7, Color(0xFFE2E9BA)).obs;
  List<bool> intervalOfDays = List.filled(7, false).obs;
  List<DateTime> reminders = <DateTime>[].obs;
  RxString customIcon = HabitIcons.icons.first.obs;
  RxInt goalCounter = 1.obs;
  RxString nameOfHabit = "".obs;
  RxString customColor = "0xFF69B884".obs;
  HabitController(this.habitUseCase);

  setInterval(int index) {
    bool value;
    intervalOfDays[index] ? value = false : value = true;
    intervalOfDays[index] = value;
    changeBtnColor(index, value);
    print("Esta entrandoo");
  }

  changeBtnColor(int index, value) {
    value
        ? btnColors[index] = Color(0xFF69B884)
        : btnColors[index] = Color.fromRGBO(226, 233, 186, 1);
  }

  setCustomColor(Color currentColor) {
    customColor.value = ColorConverter.convertToStringType(currentColor);
  }

  Color getCustomColor() {
    return ColorConverter.convertToColorType(customColor.value);
  }

  setCustomIcon(String icon) {
    customIcon.value = icon;
  }

  setName(String name) {
    nameOfHabit.value = name;
  }

  setNewReminder(DateTime newReminder) {
    if (!reminders.any((reminder) => reminder.isAtSameMomentAs(newReminder))) {
      reminders.add(newReminder);
    }
  }

  incrementCounter() {
    goalCounter.value++;
  }

  decrementCounter() {
    if (goalCounter > 1) {
      goalCounter.value--;
    }
  }

  deleteReminder(DateTime currentReminder) {
    reminders
        .removeWhere((reminder) => reminder.isAtSameMomentAs(currentReminder));
  }

  saveHabit() {
    Habit newHabit = Habit(
        name: nameOfHabit.value,
        color: customColor.value,
        icon: customIcon.value,
        reminders: reminders,
        initDate: DateTime.now(),
        goal: goalCounter.value,
        intervalOfDays: intervalOfDays);
    print(
        " Pruebaa de habito: ${newHabit.name} ${newHabit.color} ${newHabit.icon} ${newHabit.reminders[0]} ${newHabit.initDate.day.toString()} ${newHabit.goal} ");
    habitUseCase.saveHabit(newHabit);
  }

  resetToInitialStates() {
    btnColors = List.filled(7, Color(0xFFE2E9BA)).obs;
    intervalOfDays = List.filled(7, false).obs;
    reminders = <DateTime>[].obs;
    customIcon = HabitIcons.icons.first.obs;
    goalCounter = 1.obs;
    nameOfHabit = "".obs;
    customColor = "0xFF69B884".obs;
  }
}
