//packages
import 'package:flutter/material.dart';
import 'package:uptodo/core/theming/colors_manger.dart';
//widgets
import 'package:uptodo/feature/home/ui/view/widgets/custom_bottom_navigation_bar.dart';
import 'package:uptodo/feature/home/ui/view/widgets/custom_page_index.dart';

import '../widgets/add_task_bottm_sheet.dart';
import '../widgets/custom_floating_action_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;
  final TextEditingController seatsController = TextEditingController();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

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
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: customFloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            backgroundColor: ColorsManger.darkGray,
            context: context,
            isScrollControlled: true,
            builder: (context) => Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: const AddTaskBottomSheet()),
          );
        },
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: onItemTapped, currentIndex: currentIndex),
    );
  }
}
