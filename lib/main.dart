import 'package:flutter/material.dart';
import 'package:dhiaeddine_belkhiria/app/utils/router.dart' as route;
import 'package:flutter_localizations/flutter_localizations.dart';

import 'app/globalization/globalizationDelegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dhiaeddine Belkhiria',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalizationDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [Locale("en"), Locale("fr")],
      onGenerateRoute: route.generateRoute,
      initialRoute: route.startUpScreenRoute,
    );
  }
}
