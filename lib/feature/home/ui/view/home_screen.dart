//packages
import 'package:flutter/material.dart';
//widgets
import 'package:uptodo/feature/home/ui/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:uptodo/feature/home/ui/view/widgets/custom_page_index.dart';

import 'widgets/custom_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomPageIndex.pages[currentIndex],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFloatingActionButton(
        onPressed: () {},
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: onItemTapped, currentIndex: currentIndex),
    );
  }
}
