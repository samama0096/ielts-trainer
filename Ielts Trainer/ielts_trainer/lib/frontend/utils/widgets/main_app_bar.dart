import 'package:flutter/material.dart';

import '../const/mycolors.dart';

AppBar commonAppBar(
    {required bool showActions, required String title, required Function fn}) {
  return AppBar(
    title: Text(
      title,
    ),
    backgroundColor: MyColors.primaryBtnC,
    leading: IconButton(
      icon: const Icon(Icons.menu_open_rounded),
      onPressed: () => fn,
    ),
    actions: showActions
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
  );
}
