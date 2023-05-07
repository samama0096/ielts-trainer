import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ielts_trainer/backend/prefs/user_prefs.dart';
import 'package:ielts_trainer/frontend/utils/const/mycolors.dart';
import 'package:ielts_trainer/frontend/auth/login_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 1), () {
      checkState();
    });
  }

  checkState() async {
    AuthPrefs pref = AuthPrefs();
    await pref.checkIfLoggedIn().then((value) {
      if (value) {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const LoginView()),
            (route) => false);
      } else if (!value) {
        Navigator.pushAndRemoveUntil(
            context,
            CupertinoPageRoute(builder: (context) => const LoginView()),
            (route) => false);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.primaryBtnC,
      body: Center(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Container(
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(16)),
                height: 150,
                width: 150,
                child: Center(
                  child: SvgPicture.asset(
                    "lib/assets/imgs/scholar.svg",
                    color: Colors.white,
                    height: 500,
                    width: 300,
                  ),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              Text(
                "IELTS Trainer ",
                style: GoogleFonts.openSans(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Spacer(),
            ]),
      ),
    );
  }
}
