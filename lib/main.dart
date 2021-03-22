import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qrapp/pages/home_page.dart';
import 'package:qrapp/pages/map_page.dart';
import 'package:qrapp/providers/scan_list_provider.dart';
import 'package:qrapp/providers/ui_provider.dart';

import 'package:flutter_launcher_icons/android.dart';
import 'package:flutter_launcher_icons/constants.dart';
import 'package:flutter_launcher_icons/custom_exceptions.dart';
import 'package:flutter_launcher_icons/ios.dart';
import 'package:flutter_launcher_icons/main.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => new UiProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => new ScanListProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR Reader',
        initialRoute: 'home',
        routes: {
          'home': (_) => HomePage(),
          'map': (_) => MapPage(),
        },
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.blue,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: Colors.blue,
            )),
      ),
    );
  }
}
