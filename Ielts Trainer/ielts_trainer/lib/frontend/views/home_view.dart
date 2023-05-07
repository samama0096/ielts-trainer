import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ielts_trainer/frontend/utils/const/mycolors.dart';
import 'package:ielts_trainer/frontend/views/home/dashboard_view.dart';
import 'package:ielts_trainer/frontend/views/home/mocktest_view.dart';
import 'package:ielts_trainer/frontend/views/home/pmaterial_view.dart';
import 'package:ielts_trainer/frontend/views/home/ptevid_view.dart';

import '../utils/widgets/paddings.dart';
import 'home/dashboarditems/custom_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  GlobalKey<ScaffoldState> key = GlobalKey();
  int selectedIndex = 0;
  List<Widget> views = [
    const DashboardView(),
    const PMaterialView(),
    const MockTest(),
    const PVidView()
  ];
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      drawer: getDrawer(s, context),
      appBar: AppBar(
        title: Text(
          selectedIndex == 0
              ? "Hi Samama ! 👋"
              : selectedIndex == 1
                  ? "Practice Material"
                  : selectedIndex == 2
                      ? "Mock Tests"
                      : "PTE Videos",
        ),
        backgroundColor: MyColors.primaryBtnC,
        leading: IconButton(
          icon: const Icon(Icons.menu_open_rounded),
          onPressed: () => key.currentState!.openDrawer(),
        ),
        actions: selectedIndex == 0
            ? const [
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.account_circle),
                ),
                SizedBox(
                  width: 10,
                )
              ]
            : [],
      ),
      body: views[selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
            width: 500,
            decoration: BoxDecoration(
                color: MyColors.background.withOpacity(0.6),
                borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GNav(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                activeColor: MyColors.primaryBtnC.withOpacity(0.9),
                iconSize: 30,
                style: GnavStyle.google,
                padding: kPaddingSymetric(true),
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeIn,
                textStyle:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                color: Colors.grey,
                tabs: const [
                  GButton(
                    icon: Icons.home,
                    text: '',
                  ),
                  GButton(
                    icon: Icons.book_outlined,
                    text: '',
                  ),
                  GButton(
                    icon: Icons.chat_bubble_rounded,
                    text: ' ',
                  ),
                  GButton(
                    icon: Icons.slow_motion_video,
                    text: ' ',
                  ),
                ],
                selectedIndex: selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    selectedIndex = index;
                  });
                },
              ),
            )),
      ),
    );
  }
}
