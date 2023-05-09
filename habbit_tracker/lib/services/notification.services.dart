import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:habbit_tracker/data/habitDataController.dart';
import 'package:get/get.dart';
import 'dart:developer';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../domain/entities/Habit.dart';


import 'package:flutter/material.dart';


final  HabitDataController habitDataController = Get.find<HabitDataController>();


final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> initNotifications() async{ 
  
  const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('abby_toss');

  const InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );

  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.requestPermission();
}




Future<void> mostrarNotificacion() async {
  await scheduleWeeklyNotification(habitDataController.myHabits[0]);
  
  /*  const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('channel id', 'your_channel_Name', color: Color(0xFF69B884) );

  const  NotificationDetails notificationDetails = NotificationDetails(
    android: androidNotificationDetails,
  );

  await flutterLocalNotificationsPlugin.show(1,'${habitDataController.myHabits[0].name}, hola', 'Aun no realizas el habito de ${habitDataController.myHabits[0].name}, realizalo ahora para cumplir la meta', notificationDetails);
   */
  //log('${habitDataController.myHabits[0].name} ${habitDataController.myHabits[0].intervalOfDays.asMap().entries.where((entry) => entry.value == true).map((entry) => entry.key+1).toList()} ${habitDataController.myHabits[0].reminders[0].hour} ${habitDataController.myHabits[0].reminders[0].minute}');
}


Future<void> scheduleWeeklyNotification(Habit habit) async {
  
  tz.initializeTimeZones();
  
  final DateTime now = DateTime.now();

  
  final selectedDays = habit.intervalOfDays.asMap().entries.where((entry) => entry.value == true).map((entry) => entry.key+1).toList().map((day) => _nextInstanceOfWeekday(day, habit)).toList();
  
  log('Selected days: $selectedDays');
  
  for (var selectedDay in selectedDays) {

    log('Selected day: $selectedDay');
    
    var scheduledDate = tz.TZDateTime.local(selectedDay.year, selectedDay.month, selectedDay.day, habit.reminders[0].hour, habit.reminders[0].minute);
    
    log('scheduled Date:${scheduledDate}');
    
    if (scheduledDate.isBefore(now)) {
      log("futuro");
      scheduledDate = scheduledDate.add(Duration(days: 7));
    }


      const AndroidNotificationDetails androidNotificationDetails = AndroidNotificationDetails('2', 'flutterEmbedding', color: Color(0xFF69B884)  );

      const  NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      );



    flutterLocalNotificationsPlugin.zonedSchedule(
    2,
    '${habit.name}, hola',
    'Aun no realizas el habito de ${habit.name}, realizalo ahora para cumplir la meta',
    scheduledDate,
    notificationDetails,
    androidAllowWhileIdle: true,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.absoluteTime,
    matchDateTimeComponents: DateTimeComponents.time,
  );
    log('Notification scheduled for ${scheduledDate.toLocal()}');
  }
}


DateTime _nextInstanceOfWeekday(int weekday, Habit habit) {
  final now = DateTime.now();
  var date = DateTime(now.year, now.month, now.day);
  if (date.weekday > weekday) {
    date = date.add(Duration(days: 7 - date.weekday + weekday));
  } else {
    date = date.add(Duration(days: weekday - date.weekday));    }
    return date;
}
  


