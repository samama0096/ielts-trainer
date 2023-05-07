import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ielts_trainer/frontend/splash.dart';
import 'package:ielts_trainer/frontend/utils/const/mycolors.dart';
import 'package:ielts_trainer/frontend/views1/home_view.dart';

class AppMainView extends StatelessWidget {
  const AppMainView({super.key});

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "IELTS Trainer",
          ),
          backgroundColor: MyColors.primaryBtnC,
        ),
        body: Center(
          child: SizedBox(
            height: s.height,
            width: s.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: s.height * 0.4,
                  child: Image.asset("lib/assets/imgs/h1.jpg"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  child: SizedBox(
                    height: s.height * 0.45,
                    width: s.width,
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              crossAxisSpacing: 0,
                              mainAxisSpacing: 0),
                      children: [
                        buildAppBtn(s, "Ielts Trainer", () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const SplashView()));
                        }),
                        buildAppBtn(s, "OET-Doctors", () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => const HomeView()));
                        }),
                        buildAppBtn(s, "Cardiac", () {}),
                        buildAppBtn(s, "Diabetes", () {})
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildAppBtn(Size s, String name, VoidCallback onPressed) {
  return GestureDetector(
    onTap: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const SizedBox(
                  height: 50,
                  width: 50,
                  child: FaIcon(FontAwesomeIcons.boxOpen),
                ),
                Text(name)
              ]),
        ),
      ),
    ),
  );
}
