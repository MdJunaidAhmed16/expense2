import 'package:expense_2/routes/route_generator.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final RouteGenerator _router = RouteGenerator();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MaterialApp(
        initialRoute: '/signup',
        onGenerateRoute: _router.routeGenerate,
      ),
    );
  }
}