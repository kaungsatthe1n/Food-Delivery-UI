import 'package:flutter/material.dart';
import 'package:food_delivery/screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: const HomeScreen(),
    // ignore: deprecated_member_use
    theme: ThemeData(primarySwatch: Colors.green),
  ));
}
