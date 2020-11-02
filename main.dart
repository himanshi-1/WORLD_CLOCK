import 'package:flutter/material.dart';
import 'package:time_app/files/Home.dart';
import 'package:time_app/files/Loading.dart';
import 'package:time_app/files/Location.dart';

void main() {
  return runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Loading(),
      routes: {
        '/home':(context)=>Home(),
        '/loading':(context)=>Loading(),
        '/location':(context)=>Location(),

      },
    ),
  );
}

