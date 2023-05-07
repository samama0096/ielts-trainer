import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ielts_trainer/frontend/utils/const/mycolors.dart';
import 'package:ielts_trainer/frontend/views/home/dashboarditems/adsbuilder.dart';
import 'package:ielts_trainer/frontend/views/home/dashboarditems/midsection.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  List<Map<String, dynamic>> gridItems = [
    {
      "icon": Icons.headphones,
      "int": 0,
      "text": "Listening",
    },
    {
      "icon": Icons.book_outlined,
      "int": 9,
      "text": "Reading",
    },
    {
      "icon": Icons.voice_chat,
      "int": 6,
      "text": "Speaking",
    },
    {
      "icon": Icons.edit_document,
      "int": 17,
      "text": "Writing",
    },
  ];
  GlobalKey<ScaffoldState> key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: s.height,
          child: ListView(physics: const BouncingScrollPhysics(), children: [
            SizedBox(
              height: s.height * 0.4,
              child: Stack(
                children: [
                  Align(
                    alignment: Alignment.topCenter,
                    child: SizedBox(
                      child: SvgPicture.asset(
                        "lib/assets/imgs/scholar.svg",
                        color: MyColors.primaryBtnC.withOpacity(0.4),
                        height: s.height * 0.4,
                      ),
                    ),
                  ),
                  getAdsBuilder(s),
                ],
              ),
            ),
            Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
              color: Colors.grey[200],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: const Text("Exam Date: N/A"),
                trailing: MaterialButton(
                  minWidth: 50,
                  color: Colors.grey[300],
                  onPressed: () {},
                  child: const Text(
                    "Set Exam Date >",
                    style: TextStyle(color: Colors.black87),
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
              color: Colors.grey[200],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 20),
              child: Text(
                "Study Stats:",
                style: GoogleFonts.openSans(
                  color: MyColors.primaryBtnC.withOpacity(0.7),
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            getMidSectionOne(s),
            const SizedBox(
              height: 20,
            ),
            Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
              color: Colors.grey[200],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 10, top: 25, bottom: 4),
              child: ListTile(
                title: Text(
                  "Target:",
                  style: GoogleFonts.openSans(
                    color: MyColors.primaryBtnC.withOpacity(0.7),
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "0",
                      style: GoogleFonts.openSans(
                        color: Colors.black87,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      "Overall",
                      style: GoogleFonts.openSans(
                        color: Colors.black87,
                        fontSize: 10,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            getMidSectionTwo(gridItems),
            Align(
              alignment: Alignment.centerRight,
              child: SizedBox(
                  width: 120,
                  child: Center(
                    child: TextButton(
                        onPressed: () {}, child: const Text("Set Target >")),
                  )),
            ),
            Divider(
              thickness: 1,
              indent: 100,
              endIndent: 100,
              color: Colors.grey[200],
            ),
          ])),
    );
  }
}
