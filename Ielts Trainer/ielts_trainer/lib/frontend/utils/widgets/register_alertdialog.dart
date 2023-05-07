import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ielts_trainer/frontend/auth/login_view.dart';

import '../const/mycolors.dart';

showCongratsAlert(
  BuildContext context,
  Size s,
  String name,
) {
  return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                20.0,
              ),
            ),
          ),
          contentPadding: const EdgeInsets.only(
            top: 10.0,
          ),
          title: const Text(
            "Congratulations! 🎉🎊",
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18.0),
          ),
          content: SizedBox(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 2),
                      child: Center(
                          child: Text(
                              "Congrats! your account has been created.  ${name.toUpperCase()} now you can login and get access to unlimited features of IELTS Trainer. Thanks!")),
                    ),
                  ),
                ),
                Container(
                  width: double.infinity,
                  height: 60,
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(context);
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                              builder: (context) => const LoginView()),
                          (route) => false);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: MyColors.primaryBtnC,
                      // fixedSize: Size(250, 50),
                    ),
                    child: const Text(
                      "Continue!",
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      });
}
