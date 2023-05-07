import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class PVidView extends StatefulWidget {
  const PVidView({super.key});

  @override
  State<PVidView> createState() => _PVidViewState();
}

class _PVidViewState extends State<PVidView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return SizedBox(
      height: s.height * 0.9,
      child: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: sampleTexts.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                    leading: Container(
                      height: 50,
                      width: 80,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 227, 227, 227),
                          borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: FaIcon(
                          FontAwesomeIcons.youtube,
                          size: 30,
                          color: Colors.red[800],
                        ),
                      ),
                    ),
                    title: Text(sampleTexts[index]),
                    subtitle: Text(
                      "Upgrade to video plan",
                      style: GoogleFonts.openSans(
                        fontSize: 13,
                        color: Colors.blue,
                        fontWeight: FontWeight.w400,
                      ),
                    )),
              );
            }),
      ),
    );
  }
}

List<String> sampleTexts = [
  "PTE Speaking Master Class 2022",
  "PTE Writing Master Class 2022",
  "PTE Listening Master Class 2022",
  "PTE Reading Master Class 2022",
];
