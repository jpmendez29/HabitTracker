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
      this.progress = 0.0,
      required this.goal,
      required this.intervalOfDays,
      this.goalDayCompleted = false});
  incrementProgress() {
    progress++;
  }

  setGoalCompleted(bool isCompleted) {
    goalDayCompleted = isCompleted;
  }
}
