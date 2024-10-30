import 'package:flutter/material.dart';

import 'home_screen_no_data_state.dart';

class CustomPageIndex {
  static final  List<Widget> pages = [
    const HomeScreenNoDataState(),
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