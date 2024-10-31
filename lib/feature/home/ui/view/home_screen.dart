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
  final TextEditingController seatsController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    seatsController.dispose();
  }

  void onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: CustomPageIndex.pages[currentIndex],
                ),
              ],
            ),
            if (FocusScope.of(context).hasFocus)
              Positioned.fill(
                child: GestureDetector(
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                  child: Container(
                    color: Colors.transparent,
                  ),
                ),
              )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFloatingActionButton(
        onPressed: () {
          FocusScope.of(context).unfocus();
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: onItemTapped, currentIndex: currentIndex),
    );
  }
}
