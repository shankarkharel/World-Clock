import 'package:flutter/material.dart';
import 'package:World_Clock/home.dart';
import 'package:World_Clock/loading.dart';
import 'package:World_Clock/location.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => Loading(),
      '/home': (context) => Home(),
      '/location': (context) => Location(),
    },
  ));
}
