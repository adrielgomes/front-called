import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:health/home/home_bindinds.dart';
import 'package:health/home/page/home_page.dart';
import 'package:health/study/bind/study_bindings.dart';
import 'package:health/study/page/study_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(Health());
}

class Health extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [const Locale('pt', 'BR')],
      title: 'ZAFAZ HEALTH',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
          binding: HomeBindinds(),
          children: [
            GetPage(
              name: '/estudos',
              page: () => StudyPage(),
              binding: StudyBindings(),
            ),
          ],
        ),
      ],
    );
  }
}
