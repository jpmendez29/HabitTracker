import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:get/get.dart';
import 'package:habbit_tracker/pages/add_habit/controllers/habitController.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'add_habit_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:habbit_tracker/utils/HabitIcons.dart';
export 'add_habit_model.dart';

class AddHabitWidget extends StatefulWidget {
  const AddHabitWidget({Key? key}) : super(key: key);

  @override
  _AddHabitWidgetState createState() => _AddHabitWidgetState();
}

class _AddHabitWidgetState extends State<AddHabitWidget> {
  var selectedTime;
  TextEditingController _textEditingController = TextEditingController();
  Future<void> _showTimePicker() async {
    DateTime now = DateTime.now();
    final pickedTime = await showRoundedTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(now),
      locale: Locale(
          "en"), // Cambia el idioma del selector de tiempo si lo necesitas
      borderRadius: 16,
      theme: ThemeData(primarySwatch: Colors.green),
    );

    if (pickedTime != null) {
      selectedTime = DateTime(
        now.year,
        now.month,
        now.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      print(pickedTime.hour);
      print(DateFormat.jm().format(selectedTime));
      habitController.setNewReminder(selectedTime);
    }
  }

  void showCustomDialog(BuildContext context) {
    try {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Seleccionar icono'),
            content: Container(
              width: double.maxFinite,
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: HabitIcons.icons.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Número de iconos por fila
                  mainAxisSpacing: 8.0, // Espacio vertical entre filas
                  crossAxisSpacing: 8.0, // Espacio horizontal entre iconos
                ),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context, HabitIcons.icons[index]);
                    },
                    child: SvgPicture.asset(HabitIcons.icons[index]),
                  );
                },
              ),
            ),
          );
        },
      ).then((selectedIcon) {
        if (selectedIcon != null) {
          habitController.setCustomIcon(selectedIcon);
        }
      });
    } catch (e) {
      print("Error $e");
    }
  }

  late AddHabitModel _model;
  HabitController habitController = Get.find();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => AddHabitModel());

    _model.textController1 ??= TextEditingController();
    _model.textController2 ??= TextEditingController(text: '03');
    _model.textController3 ??= TextEditingController(text: 'día');
  }

  @override
  void dispose() {
    _model.dispose();
    habitController.resetToInitialStates();
    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: Colors.white,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: AlignmentDirectional(1.0, 0.0),
            child: Text(
              'Añadir',
              style: FlutterFlowTheme.of(context).headlineMedium.override(
                    fontFamily: 'Nunito',
                    color: Color(0xFF3C7E5B),
                    fontSize: 26.0,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          actions: [
            FFButtonWidget(
              onPressed: () async {
                context.safePop();
              },
              text: '',
              icon: Icon(
                Icons.close,
                color: Color(0xBACDE2E9BA),
                size: 60.0,
              ),
              options: FFButtonOptions(
                width: 130.0,
                height: 40.0,
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                iconPadding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                color: Colors.white,
                textStyle: FlutterFlowTheme.of(context).titleSmall.override(
                      fontFamily: 'Poppins',
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                borderSide: BorderSide(
                  color: Colors.transparent,
                  width: 1.0,
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
          ],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Align(
                alignment: AlignmentDirectional(-1.0, 0.0),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(65.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'Hábito',
                    style: FlutterFlowTheme.of(context).bodyMedium.override(
                          fontFamily: 'Nunito',
                          color: Color(0xFF3C7E5B),
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Expanded(
                    child: Align(
                      alignment: AlignmentDirectional(-1.0, 0.0),
                      child: Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(50.0, 0.0, 0.0, 0.0),
                        child: Container(
                          width: 270.0,
                          child: TextFormField(
                            controller: _textEditingController,
                            autofocus: true,
                            obscureText: false,
                            decoration: InputDecoration(
                              hintStyle: FlutterFlowTheme.of(context).bodySmall,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF69B884),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0x00000000),
                                  width: 3.0,
                                ),
                                borderRadius: BorderRadius.circular(18.0),
                              ),
                            ),
                            style: FlutterFlowTheme.of(context).bodyMedium,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Este campo es obligatorio';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Align(
                          alignment: AlignmentDirectional(-0.7, 0.0),
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Text(
                              'Ícono',
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Nunito',
                                    color: Color(0xFF3C7E5B),
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                            ),
                          ),
                        ),
                        Align(
                            alignment: AlignmentDirectional(-0.8, -0.4),
                            child: Obx(
                              () => IconButton(
                                icon: SvgPicture.asset(
                                  '${habitController.customIcon.value}',
                                ),
                                onPressed: () {
                                  try {
                                    showCustomDialog(context);
                                  } catch (e) {
                                    print("Error $e");
                                  }
                                },
                                color: Color(0xFF69B884),
                                iconSize: 80.0,
                                padding: EdgeInsets.all(10.0),
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                hoverColor: Colors.transparent,
                                tooltip: 'Seleccionar icono',
                              ),
                            )),
                      ],
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(40.0, 0.0, 0.0, 0.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Align(
                            alignment: AlignmentDirectional(-0.7, 0.0),
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 10.0, 0.0, 0.0),
                              child: Text(
                                'Color',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Nunito',
                                      color: Color(0xFF3C7E5B),
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(-0.8, -0.4),
                            child: Obx(() => FlutterFlowIconButton(
                                  borderColor: Color(0xFF69B884),
                                  borderRadius: 100.0,
                                  borderWidth: 10.0,
                                  buttonSize: 95.0,
                                  icon: FaIcon(
                                    FontAwesomeIcons.solidCircle,
                                    color: habitController.getCustomColor(),
                                    size: 60.0,
                                  ),
                                  onPressed: () {
                                    Color selectedColor = Colors.blue;
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Selecciona un color'),
                                          content: SingleChildScrollView(
                                            child: ColorPicker(
                                              pickerColor: selectedColor,
                                              onColorChanged: (Color color) {
                                                setState(() {
                                                  selectedColor = color;
                                                });
                                              },
                                              pickerAreaHeightPercent: 0.8,
                                            ),
                                          ),
                                          actions: [
                                            ElevatedButton(
                                              child: Text('Seleccionar'),
                                              onPressed: () {
                                                habitController.setCustomColor(
                                                    selectedColor);
                                                Navigator.of(context).pop();
                                                // Aquí puedes utilizar el color seleccionado
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },
                                )),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(65.0, 10.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Meta',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: Color(0xFF3C7E5B),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 50.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFE2E9BA),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            icon: Icon(Icons.arrow_left),
                            onPressed: () =>
                                {habitController.decrementCounter()}),
                        Obx(() => Text(
                              '${habitController.goalCounter}',
                              style: TextStyle(fontSize: 20.0),
                            )),
                        IconButton(
                            icon: Icon(Icons.arrow_right),
                            onPressed: () =>
                                {habitController.incrementCounter()})
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    alignment: AlignmentDirectional(0.0, -0.8),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 0.0, 0.0, 0.0),
                      child: Text(
                        'veces al día',
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Nunito',
                              color: Color(0xFF3C7E5B),
                              fontSize: 22.0,
                              fontWeight: FontWeight.w300,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 10.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Intervalo',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Nunito',
                            color: Color(0xFF3C7E5B),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Obx(() => FFButtonWidget(
                            onPressed: () {
                              habitController.setInterval(0);
                            },
                            text: 'Lun',
                            options: FFButtonOptions(
                              width: 110.0,
                              height: 40.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: habitController.btnColors[0],
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color.fromRGBO(60, 126, 91, 1),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          )),
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Obx(() => FFButtonWidget(
                                  onPressed: () {
                                    habitController.setInterval(2);
                                  },
                                  text: 'Miér',
                                  options: FFButtonOptions(
                                    width: 110.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: habitController.btnColors[2],
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color.fromRGBO(60, 126, 91, 1),
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                )),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 10.0, 0.0, 0.0),
                            child: Obx(() => FFButtonWidget(
                                  onPressed: () {
                                    habitController.setInterval(4);
                                  },
                                  text: 'Viern',
                                  options: FFButtonOptions(
                                    width: 110.0,
                                    height: 40.0,
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    iconPadding: EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                    color: habitController.btnColors[4],
                                    textStyle: FlutterFlowTheme.of(context)
                                        .titleSmall
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: Color.fromRGBO(60, 126, 91, 1),
                                        ),
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1.0,
                                    ),
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Obx(() => FFButtonWidget(
                              onPressed: () {
                                habitController.setInterval(1);
                              },
                              text: 'Mar',
                              options: FFButtonOptions(
                                width: 110.0,
                                height: 40.0,
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                iconPadding: EdgeInsetsDirectional.fromSTEB(
                                    0.0, 0.0, 0.0, 0.0),
                                color: habitController.btnColors[1],
                                textStyle: FlutterFlowTheme.of(context)
                                    .titleSmall
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: Color.fromRGBO(60, 126, 91, 1),
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1.0,
                                ),
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            )),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Obx(() => FFButtonWidget(
                                onPressed: () {
                                  habitController.setInterval(3);
                                },
                                text: 'Jue',
                                options: FFButtonOptions(
                                  width: 110.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: habitController.btnColors[3],
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color.fromRGBO(60, 126, 91, 1),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              )),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 10.0, 0.0, 0.0),
                          child: Obx(() => FFButtonWidget(
                                onPressed: () {
                                  habitController.setInterval(5);
                                },
                                text: 'Sáb',
                                options: FFButtonOptions(
                                  width: 110.0,
                                  height: 40.0,
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  iconPadding: EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 0.0),
                                  color: habitController.btnColors[5],
                                  textStyle: FlutterFlowTheme.of(context)
                                      .titleSmall
                                      .override(
                                        fontFamily: 'Poppins',
                                        color: Color.fromRGBO(60, 126, 91, 1),
                                      ),
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1.0,
                                  ),
                                  borderRadius: BorderRadius.circular(8.0),
                                ),
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                    child: Obx(() => FFButtonWidget(
                          onPressed: () {
                            habitController.setInterval(6);
                          },
                          text: 'Dom',
                          options: FFButtonOptions(
                            width: 110.0,
                            height: 40.0,
                            padding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            iconPadding: EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 0.0, 0.0),
                            color: habitController.btnColors[6],
                            textStyle: FlutterFlowTheme.of(context)
                                .titleSmall
                                .override(
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(60, 126, 91, 1),
                                ),
                            borderSide: BorderSide(
                              color: Colors.transparent,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        )),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 15.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Recordatorios',
                      style: FlutterFlowTheme.of(context).bodyMedium.override(
                            fontFamily: 'Poppins',
                            color: Color(0xFF3C7E5B),
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
              Obx(() => ListView.builder(
                  itemCount: habitController.reminders.length,
                  itemBuilder: (context, index) {
                    DateTime currentDateReminder =
                        habitController.reminders[index];
                    return Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 10.0, 0.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FFButtonWidget(
                            onPressed: () {
                              print('Button pressed ...');
                            },
                            text:
                                "${DateFormat.jm().format(currentDateReminder)}",
                            options: FFButtonOptions(
                              width: 170.0,
                              height: 45.0,
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              iconPadding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 0.0),
                              color: Color.fromRGBO(226, 233, 186, 1),
                              textStyle: FlutterFlowTheme.of(context)
                                  .titleSmall
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Color.fromRGBO(60, 126, 91, 1),
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1.0,
                              ),
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical)),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FFButtonWidget(
                      onPressed: () {
                        _showTimePicker();
                      },
                      text: '',
                      icon: Icon(
                        Icons.add,
                        size: 15.0,
                      ),
                      options: FFButtonOptions(
                        width: 170.0,
                        height: 45.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: Color.fromRGBO(105, 184, 132, 1),
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Poppins',
                                  color: Colors.white,
                                ),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0.0, 8.0, 0.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 20.0),
                      child: FFButtonWidget(
                        onPressed: () async {
                          String text = _textEditingController.text;
                          if (text.isNotEmpty && text.trim().isNotEmpty) {
                            habitController.saveHabit();
                            habitController.resetToInitialStates();
                            context.pushNamed(
                              'HomePage',
                              extra: <String, dynamic>{
                                kTransitionInfoKey: TransitionInfo(
                                  hasTransition: true,
                                  transitionType:
                                      PageTransitionType.leftToRight,
                                  duration: Duration(milliseconds: 350),
                                ),
                              },
                            );
                          } else {
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Información incompleta'),
                                  content: Text(
                                      'Por favor, complete la información requerida.'),
                                  actions: [
                                    TextButton(
                                      child: Text('Aceptar'),
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                  ],
                                );
                              },
                            );
                          }
                        },
                        text: 'Añadir',
                        options: FFButtonOptions(
                          width: 280.0,
                          height: 52.0,
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          iconPadding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 0.0),
                          color: Color(0xFF3C7E5B),
                          textStyle: FlutterFlowTheme.of(context)
                              .headlineSmall
                              .override(
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
