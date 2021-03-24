import 'package:flutter/material.dart';
import 'package:flutter_ai_playground/home_page.dart';

import 'features/cat_vs_dog/presentation/pages/cat_vs_dog_page_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => MyHomePage(),
        '/cat_vs_dog': (context) => CatVsDogPageRoute(),
      },
    );
  }
}
