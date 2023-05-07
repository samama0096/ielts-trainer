import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ielts_trainer/frontend/views1/dashboard_view.dart';
import 'package:ielts_trainer/frontend/views1/leaderboard_view.dart';
import 'package:ielts_trainer/frontend/views1/profile_view.dart';
import 'package:ielts_trainer/frontend/views1/refferal_view.dart';
import 'package:ielts_trainer/frontend/views1/settings_view.dart';

import '../utils/const/mycolors.dart';
import '../utils/widgets/paddings.dart';

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
    const ProfileView(),
    const LeaderboardView(),
    const RefferalView(),
    const SettingsView()
  ];
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: const Text(
          "IELTS Medical",
        ),
        backgroundColor: MyColors.primaryBtnC,
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
                    icon: Icons.account_box,
                    text: '',
                  ),
                  GButton(
                    icon: Icons.leaderboard,
                    text: '',
                  ),
                  GButton(
                    icon: Icons.manage_accounts,
                    text: ' ',
                  ),
                  GButton(
                    icon: Icons.settings,
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
