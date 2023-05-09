import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:habbit_tracker/data/habitDataController.dart';
import 'package:habbit_tracker/domain/use_cases/addHabit.dart';
import 'package:habbit_tracker/utils/colorConverter.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../domain/entities/Habit.dart';

class HomePageController extends GetxController {
  addHabit habitUseCase;
  late List<Habit> mondayHabits;
  late List<Habit> tuesdayHabits;
  late List<Habit> wednesdayHabits;
  late List<Habit> thursdayHabits;
  late List<Habit> fridayHabits;
  late List<Habit> saturdayHabits;
  late List<Habit> sundayHabits;
  HabitDataController habitDataController = Get.find();
  RxBool showIcon = false.obs;
  late List<Habit> listOfHabits = habitDataController.myHabits;
  RxInt counterIndex = 0.obs;
  late List<List<Habit>> showingList;
  HomePageController({required this.habitUseCase});

  List<Habit> sortListByDay(int indexOfDay) {
    List<Habit> finalList = <Habit>[];
    listOfHabits.forEach((habit) {
      if (habit.intervalOfDays[indexOfDay]) finalList.add(habit);
    });
    return finalList;
  }

  setListByDay() {
    mondayHabits = sortListByDay(0).obs;
    tuesdayHabits = sortListByDay(1).obs;
    wednesdayHabits = sortListByDay(2).obs;
    thursdayHabits = sortListByDay(3).obs;
    fridayHabits = sortListByDay(4).obs;
    saturdayHabits = sortListByDay(5).obs;
    sundayHabits = sortListByDay(6).obs;
    showingList = [
      mondayHabits,
      tuesdayHabits,
      wednesdayHabits,
      thursdayHabits,
      fridayHabits,
      saturdayHabits,
      sundayHabits
    ].obs;
  }

  moveForwardDay() {
    if (counterIndex.value < 6) {
      counterIndex++;
    }
  }

  moveBackwardDay() {
    if (counterIndex.value > 0) {
      counterIndex--;
    }
  }

  Widget buildCircularPercentIndicator(Habit habit, context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                    title: Text("Metas para: ${habit.name}"),
                    content: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight:
                            400, // Ajusta la altura máxima según tus necesidades
                      ),
                      child: Container(
                        width: 100,
                        height: 100,
                        child: Obx(() => ListView.builder(
                              itemCount: habit.reminders.length,
                              itemBuilder: (BuildContext context, int index) {
                                String task = "Completar tarea";
                                return CheckboxListTile(
                                  title: Text(task),
                                  value: false,
                                  onChanged: (bool? value) {
                                    // Lógica para cambiar el estado de la tarea
                                  },
                                );
                              },
                            )),
                      ),
                    ));
              },
            );
          },
          child: OverflowBox(
              alignment: Alignment.center,
              maxWidth: double.infinity,
              child: CircularPercentIndicator(
                percent: habit.progress,
                radius: 60.0,
                lineWidth: 16.0,
                animation: true,
                progressColor: ColorConverter.convertToColorType(habit.color),
                backgroundColor: Colors.white,
                center: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(habit.icon),
                      onPressed: () {},
                    ),
                    Text(
                      "",
                      style:
                          TextStyle(fontFamily: 'Poppins', color: Colors.black),
                    ),
                  ],
                ),
              )),
        ),
        Obx(() {
          if (showIcon.isTrue) {
            return Positioned(
              top: -5,
              right: 0,
              left: 85,
              child: IconButton(
                icon: Transform.scale(
                    scale: 1.2,
                    child: Icon(
                      Icons.close,
                      color: Color(0xFFF61000),
                    )),
                onPressed: () {
                  deleteFromList(habit.name);
                  habitUseCase.deleteHabit(habit.name);
                },
              ),
            );
          } else {
            return Container();
          }
        }),
      ],
    );
  }

  deleteFromList(String name) {
    showingList.forEach((habits) {
      habits.removeWhere((habit) => habit.name == name);
    });
  }
}
