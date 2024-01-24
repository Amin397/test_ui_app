import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testapp/Controller/Dashboard/dashboard_controller.dart';
import 'package:testapp/Controller/Home/home_controller.dart';
import 'package:testapp/Controller/Intro/intro_controller.dart';
import 'package:testapp/View/Intro/intro_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();


  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => IntroController()),
        ChangeNotifierProvider(create: (_) => DashboardController()),
        ChangeNotifierProvider(create: (_) => HomeController()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: IntroScreen(),
        theme: ThemeData(
          fontFamily: 'roman',
        ),
      ),
    ),
  );
}
