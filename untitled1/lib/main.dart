import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'expenseModel.dart';
import 'homepage.dart'; 

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BudgetModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bütçe Takibi',
      home: Homepage(),
    );
  }
}
