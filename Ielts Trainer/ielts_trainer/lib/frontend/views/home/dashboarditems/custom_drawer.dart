import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ielts_trainer/backend/prefs/user_prefs.dart';
import 'package:ielts_trainer/backend/services/userfirebase_service.dart';
import 'package:ielts_trainer/frontend/auth/login_view.dart';

getDrawer(Size s, BuildContext context) {
  return Drawer(
    child: SizedBox(
      height: s.height * 0.9,
      child: ListView(
        children: [
          const UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.white),
            accountName: Text(
              "Samama",
              style: TextStyle(color: Colors.black87),
            ),
            accountEmail: Text(
              "samama0096@gmail.com",
              style: TextStyle(
                  color: Colors.black87,
                  fontStyle: FontStyle.italic,
                  fontSize: 10),
            ),
            currentAccountPictureSize: Size.square(80),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.black,
              child: Icon(
                Icons.photo_album,
                size: 30,
              ),
            ),
          ),
          ListTile(
            tileColor: Colors.yellow[600]!.withOpacity(0.7),
            leading: CircleAvatar(
                backgroundColor: Colors.white,
                child: Center(
                    child: Icon(
                  Icons.workspace_premium,
                  color: Colors.yellow[700],
                ))),
            title: const Text("Upgrade to Premium! 👑"),
            subtitle: const Text(
              "Change plan now ",
              style: TextStyle(decoration: TextDecoration.underline),
            ),
          ),
          const ExpansionTile(
            title: Text("Practice Material"),
            leading: Icon(Icons.book),
          ),
          const ListTile(
            leading: Icon(Icons.document_scanner),
            title: Text("Templates"),
          ),
          const ExpansionTile(
            title: Text("Mock Tests"),
            leading: Icon(Icons.chat_bubble_rounded),
          ),
          const ListTile(
            leading: Icon(Icons.slow_motion_video),
            title: Text("PTE Secret Strategy Videos"),
          ),
          const ExpansionTile(
            title: Text("Daily Goals"),
            leading: Icon(Icons.sort),
          ),
          const ListTile(
            leading: Icon(Icons.live_tv),
            title: Text("Live Sessions"),
          ),
          const ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text("Notifications"),
          ),
          const ExpansionTile(
            title: Text("Support"),
            leading: Icon(Icons.contact_support_outlined),
          ),
          const ListTile(
            leading: Icon(Icons.contact_page),
            title: Text("Contact US"),
          ),
          TextButton(
              onPressed: () async {
                UserFirebaseServices userFirebaseServices =
                    UserFirebaseServices();
                await userFirebaseServices.signOut();
                AuthPrefs prefs = AuthPrefs();
                await prefs.delUserDataFromDevice();
                Navigator.pushAndRemoveUntil(
                    context,
                    CupertinoPageRoute(builder: (context) => const LoginView()),
                    (route) => false);
              },
              child: const Text("Logout"))
        ],
      ),
    ),
  );
}
