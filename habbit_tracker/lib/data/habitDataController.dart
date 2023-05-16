import 'dart:async';
import 'dart:developer';

import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';

import '../controllers/authentication_controller.dart';
import '../domain/entities/Habit.dart';
import '../../services/notification.services.dart';

class HabitDataController extends GetxController {
  List<Habit> myHabits = <Habit>[].obs;
  late StreamSubscription<DatabaseEvent> newEntryStreamSubscription;

  // stream de actualizaciones
  late StreamSubscription<DatabaseEvent> updateEntryStreamSubscription;
  
  // referencia a la base de datos
  final databaseReference = FirebaseDatabase.instance.ref();
  
  final AuthenticationController authenticationController = Get.find();

  addHabit(Habit newHabit) async {
    String Uid = authenticationController.getUid();
    try {
      myHabits.add(newHabit);
        await databaseReference
          .child('Habitos')
          .child(Uid)
          .push()
          .set(newHabit.toJson());
    } catch (error) {
      logError(error);
      return Future.error(error);
    }
    print(
        " Pruebaa de habito en dataController: ${newHabit.name} ${newHabit.color} ${newHabit.icon} ${newHabit.reminders[0]} ${newHabit.initDate.day.toString()} ${newHabit.goal} ${newHabit.intervalOfDays} ");
  }

  deleteHabit(String name) {
    myHabits.removeWhere((currentHabit) => currentHabit.name == name);
  }

  inithabits() async {
    log("hola aca dentro");
    myHabits.clear();
        try {
          DatabaseEvent dataSnapshot = await databaseReference
              .child('Habitos')
              .child(authenticationController.getUid())
              .once();

            if (dataSnapshot.snapshot.value != null) {
              Map<dynamic, dynamic> habitMap = dataSnapshot.snapshot.value as Map<dynamic, dynamic>;

              habitMap.forEach((key, value) async {
                Map<String, dynamic> habitData = Map<String, dynamic>.from(value);
                Habit habit = Habit.fromJson(habitData);
                await scheduleWeeklyNotification(habit);
                myHabits.add(habit);
              });

            }
        } catch (error) {
          logError(error);
          return Future.error(error);
        }
  }

  _onEntryAdded(DatabaseEvent event) {
    final json = event.snapshot.value as Map<dynamic, dynamic>;
    myHabits.add(json['Habito']);
  }

  // método en el que cerramos los streams
  void unsubscribe() {
      newEntryStreamSubscription.cancel();
  }
}