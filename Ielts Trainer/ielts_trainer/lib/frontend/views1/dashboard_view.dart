import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(22)),
            height: s.height * 0.3,
            child: Image.asset(
              "lib/assets/imgs/oetdoctors.jpg",
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: s.height * 0.45,
            child: ListView.separated(
                physics: const BouncingScrollPhysics(),
                separatorBuilder: (context, index) {
                  return Divider(
                    thickness: 1.2,
                    indent: s.width * 0.1,
                    endIndent: s.width * 0.1,
                  );
                },
                itemCount: tileTexts.length,
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(35),
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25, vertical: 10),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: index % 2 == 0
                                ? Colors.green
                                : Colors.blue[400],
                            radius: 25,
                            child: Center(
                                child: Icon(
                              icons[index],
                              color: Colors.white,
                            )),
                          ),
                          title: Text(tileTexts[index]),
                        ),
                      ),
                    ),
                  );
                }),
          )
        ],
      )),
    );
  }
}

List<String> tileTexts = [
  'Courses & Exams',
  'OET Mock Exams & Grammar Boosters',
  'Updated OET Tips',
  'OET Writing Correction',
  'Download Material & Access Audio',
  'Contact Expert',
  'Introduce Yourself',
  'Contact Us',
  'Join Free Webinar'
];

List<IconData> icons = [
  Icons.class_,
  Icons.edit_document,
  Icons.lightbulb_circle,
  Icons.done_all,
  Icons.book,
  Icons.contact_page,
  Icons.chat_bubble,
  Icons.call,
  Icons.live_tv
];
