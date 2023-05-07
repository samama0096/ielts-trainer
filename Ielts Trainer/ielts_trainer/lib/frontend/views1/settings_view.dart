import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(children: [
          Container(
            height: s.height * 0.44,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            child: Image.asset(
              "lib/assets/imgs/oetdoctors.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Opacity(
            opacity: 0.95,
            child: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const UserAccountsDrawerHeader(
                        decoration: BoxDecoration(color: Colors.white),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 30,
                        ),
                        accountName: Text(
                          'Samama Majeed',
                          style: TextStyle(color: Colors.black),
                        ),
                        accountEmail: Text(
                          "samama0096@gmail.com",
                          style: TextStyle(color: Colors.black),
                        )),
                    Container(
                      width: s.width * 0.95,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.grey[200]),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 1, vertical: 12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: Center(
                                    child: Icon(
                                  Icons.change_circle,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text("Change Password"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(
                              thickness: 1,
                              indent: s.width * 0.1,
                              endIndent: s.width * 0.1,
                            ),
                            const ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: Center(
                                    child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text("Delete Account"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(
                              thickness: 1,
                              indent: s.width * 0.1,
                              endIndent: s.width * 0.1,
                            ),
                            const ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: Center(
                                    child: Icon(
                                  Icons.info,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text("About OET for Doctors"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(
                              thickness: 1,
                              indent: s.width * 0.1,
                              endIndent: s.width * 0.1,
                            ),
                            const ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: Center(
                                    child: Icon(
                                  CupertinoIcons.collections_solid,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text("Terms & Conditions"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(
                              thickness: 1,
                              indent: s.width * 0.1,
                              endIndent: s.width * 0.1,
                            ),
                            const ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: Center(
                                    child: Icon(
                                  Icons.security,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text("Privacy Policy"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(
                              thickness: 1,
                              indent: s.width * 0.1,
                              endIndent: s.width * 0.1,
                            ),
                            const ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: Center(
                                    child: Icon(
                                  Icons.share,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text("Share"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                            Divider(
                              thickness: 1,
                              indent: s.width * 0.1,
                              endIndent: s.width * 0.1,
                            ),
                            const ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 25,
                                child: Center(
                                    child: Icon(
                                  Icons.logout_rounded,
                                  color: Colors.white,
                                )),
                              ),
                              title: Text("Logout"),
                              trailing: Icon(Icons.arrow_forward_ios),
                            ),
                          ],
                        ),
                      )),
                    )
                  ]),
            ),
          ),
        ]),
      ),
    );
  }
}
