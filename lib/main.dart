import 'package:flutter/material.dart';
import 'package:app_mania/views/Detail_Page.dart';
import 'package:app_mania/views/Favourite_Page.dart';
import 'package:app_mania/views/Home_Page.dart';
import 'package:app_mania/views/Meal_Page.dart';
import 'package:app_mania/views/Recipe_Page.dart';

void main() {
  runApp(
    AppMania(),
  );
}

class AppMania extends StatelessWidget {
  const AppMania({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Homepage(),
        'detail_page': (context) => DetailPage(),
        'Recipe_page': (context) => RecipePage(),
        'meal_Page': (context) => MealPage(),
        'fav_page': (context) => FavPage(),
      },
    );
  }
}
