import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class Habit {
  String name;
  String icon;
  String color;
  double progress;
  int goal;
  bool goalDayCompleted;
  List<bool> intervalOfDays;
  List<DateTime> reminders;
  DateTime initDate;

  Habit(
      {required this.name,
      required this.color,
      required this.icon,
      required this.reminders,
      required this.initDate,
      this.progress = 0.5,
      required this.goal,
      required this.intervalOfDays,
      this.goalDayCompleted = false});


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'icon': icon,
      'color': color,
      'progress': progress,
      'goal': goal,
      'goalDayCompleted': goalDayCompleted,
      'intervalOfDays': intervalOfDays,
      'reminders': reminders.map((e) => e.toIso8601String()).toList(),
      'initDate': initDate.toIso8601String(),
    };
  }

  factory Habit.fromJson(Map<String, dynamic> json) {
  return Habit(
    name: json['name'],
    icon: json['icon'],
    color: json['color'],
    progress: json['progress'],
    goal: json['goal'],
    goalDayCompleted: json['goalDayCompleted'],
    intervalOfDays: List<bool>.from(json['intervalOfDays']),
    reminders: (json['reminders'] as List<dynamic>)
        .map((e) => DateTime.parse(e))
        .toList(),
    initDate: DateTime.parse(json['initDate']),
  );
}
  

  incrementProgress() {
    progress++;
  }

  setGoalCompleted(bool isCompleted) {
    goalDayCompleted = isCompleted;
  }


}
