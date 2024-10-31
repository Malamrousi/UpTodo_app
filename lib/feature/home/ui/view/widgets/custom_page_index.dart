import 'package:flutter/material.dart';

import 'index_screen_has_data.dart';

class CustomPageIndex {
  static final  List<Widget> pages = [
    const IndexScreenHasData(),
    const Center(
        child: Text(
      'Calendar Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      'Focus Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
    const Center(
        child: Text(
      'Profile Page',
      style: TextStyle(color: Colors.white, fontSize: 30),
    )),
  ];
}