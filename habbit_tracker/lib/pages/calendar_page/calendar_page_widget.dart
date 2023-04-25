import '/flutter_flow/flutter_flow_calendar.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'calendar_page_model.dart';
export 'calendar_page_model.dart';

class CalendarPageWidget extends StatefulWidget {
  const CalendarPageWidget({Key? key}) : super(key: key);

  @override
  _CalendarPageWidgetState createState() => _CalendarPageWidgetState();
}

class _CalendarPageWidgetState extends State<CalendarPageWidget> {
  late CalendarPageModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _unfocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => CalendarPageModel());
  }

  @override
  void dispose() {
    _model.dispose();

    _unfocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFFF5F5F5),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 500.0,
              height: 700.0,
              decoration: BoxDecoration(
                color: FlutterFlowTheme.of(context).secondaryBackground,
              ),
              child: FlutterFlowCalendar(
                color: Color(0xFF3C7E5B),
                iconColor: Color(0xFF69B884),
                weekFormat: false,
                weekStartsMonday: false,
                rowHeight: 46.0,
                onChange: (DateTimeRange? newSelectedDate) {
                  setState(() => _model.calendarSelectedDay = newSelectedDate);
                },
                titleStyle: GoogleFonts.getFont(
                  'Nunito',
                  color: Color(0xFF3C7E5B),
                  fontWeight: FontWeight.bold,
                ),
                dayOfWeekStyle: GoogleFonts.getFont(
                  'Nunito',
                  color: Color(0xFF3C7E5B),
                  fontWeight: FontWeight.w300,
                ),
                dateStyle: GoogleFonts.getFont(
                  'Nunito',
                  fontWeight: FontWeight.normal,
                  fontSize: 12.0,
                ),
                selectedDateStyle: TextStyle(),
                inactiveDateStyle: TextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
