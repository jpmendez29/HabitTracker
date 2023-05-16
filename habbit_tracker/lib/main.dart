import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:habbit_tracker/data/habitDataController.dart';
import 'package:habbit_tracker/domain/use_cases/addHabit.dart';
import 'package:habbit_tracker/pages/add_habit/controllers/habitController.dart';
import 'package:habbit_tracker/pages/home_page/controllers/homePageController.dart';
import 'package:habbit_tracker/services/notification.services.dart';
import 'Controllers/user_controller.dart';
import 'config/configuration.dart';
import 'controllers/authentication_controller.dart';
import 'flutter_flow/flutter_flow_theme.dart';
import 'flutter_flow/flutter_flow_util.dart';
import 'flutter_flow/internationalization.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';
import 'flutter_flow/nav/nav.dart';
import 'index.dart';
import 'package:habbit_tracker/pages/signin/signin_controller.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FlutterFlowTheme.initialize();
  await initNotifications();
  await Firebase.initializeApp(
      name: 'HabbitTracker',
        options: const FirebaseOptions(
          apiKey: Configuration.apiKey,
          authDomain: Configuration.authDomain,
          databaseURL: Configuration.databaseURL,
          projectId: Configuration.projectId,
          // storageBucket: Configuration.storageBucket,
          messagingSenderId: Configuration.messagingSenderId,
          appId: Configuration.appId,
          // measurementId: Configuration.measurementId),
  ));

  Get.put(UserController());
  Get.put(AuthenticationController());
  Get.put(HabitDataController());
  Get.put(signin_controller());
  Get.put(HomePageController(habitUseCase: new addHabit()));
  Get.put(HabitController(new addHabit()));

  
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();
  

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  late AppStateNotifier _appStateNotifier;
  late GoRouter _router;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    _router = createRouter(_appStateNotifier);
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'HabbitTracker',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: _themeMode,
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
    );
  }
}

class NavBarPage extends StatefulWidget {
  NavBarPage({Key? key, this.initialPage, this.page}) : super(key: key);

  final String? initialPage;
  final Widget? page;

  @override
  _NavBarPageState createState() => _NavBarPageState();
}

/// This is the private State class that goes with NavBarPage.
class _NavBarPageState extends State<NavBarPage> {
  String _currentPageName = 'CalendarPage';
  late Widget? _currentPage;

  @override
  void initState() {
    super.initState();
    _currentPageName = widget.initialPage ?? _currentPageName;
    _currentPage = widget.page;
  }

  @override
  Widget build(BuildContext context) {
    final tabs = {
      'CalendarPage': CalendarPageWidget(),
      'Estadisticas': EstadisticasWidget(),
      'HomePage': HomePageWidget(),
      'Perfil': PerfilWidget(),
    };
    final currentIndex = tabs.keys.toList().indexOf(_currentPageName);
    return Scaffold(
      body: _currentPage ?? tabs[_currentPageName],
      extendBody: true,
      bottomNavigationBar: FloatingNavbar(
        currentIndex: currentIndex,
        onTap: (i) => setState(() {
          _currentPage = null;
          _currentPageName = tabs.keys.toList()[i];
        }),
        backgroundColor: Color(0xFF3C7E5B),
        selectedItemColor: Color(0xFF69B884),
        unselectedItemColor: Color(0xFFE2E9BA),
        selectedBackgroundColor: Color(0x00000000),
        borderRadius: 40.0,
        itemBorderRadius: 8.0,
        margin: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
        width: 300.0,
        elevation: 0.0,
        items: [
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.solidCalendar,
                  color:
                      currentIndex == 0 ? Color(0xFF69B884) : Color(0xFFE2E9BA),
                  size: 24.0,
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  FontAwesomeIcons.solidChartBar,
                  color:
                      currentIndex == 1 ? Color(0xFF69B884) : Color(0xFFE2E9BA),
                  size: 24.0,
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.home_outlined,
                  color:
                      currentIndex == 2 ? Color(0xFF69B884) : Color(0xFFE2E9BA),
                  size: 24.0,
                ),
              ],
            ),
          ),
          FloatingNavbarItem(
            customWidget: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  color:
                      currentIndex == 3 ? Color(0xFF69B884) : Color(0xFFE2E9BA),
                  size: 24.0,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
