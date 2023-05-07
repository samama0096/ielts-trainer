import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../utils/const/mycolors.dart';

getMidSectionOne(Size s) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 08),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: MyColors.primaryBtnC.withOpacity(0.7)),
      height: s.height * 0.13,
      child: Center(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "0",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Mock  Pract.",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 0.3,
                  height: s.height * 0.07,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "0",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Questions Pract.",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: Container(
                  width: 0.3,
                  height: s.height * 0.07,
                  color: Colors.white,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "0",
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "Days Pract.",
                    maxLines: 2,
                    overflow: TextOverflow.clip,
                    style: GoogleFonts.openSans(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              )
            ]),
      ),
    ),
  );
}

getMidSectionTwo(List<Map<String, dynamic>> gridItems) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10),
    child: Container(
      height: 200,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.grey[200]!),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 230, 135, 135),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Icon(
                              gridItems[0]["icon"],
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gridItems[0]["int"].toString()),
                          Text(gridItems[0]["text"].toString())
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 136, 193, 117),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Icon(
                              gridItems[2]["icon"],
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gridItems[2]["int"].toString()),
                          Text(gridItems[2]["text"].toString())
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 95, 147, 232),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Icon(
                              gridItems[1]["icon"],
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gridItems[1]["int"].toString()),
                          Text(gridItems[1]["text"].toString())
                        ],
                      )
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 211, 134, 241),
                              borderRadius: BorderRadius.circular(20)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 14, vertical: 12),
                            child: Icon(
                              gridItems[3]["icon"],
                              color: Colors.white,
                            ),
                          )),
                      const SizedBox(
                        width: 12,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(gridItems[3]["int"].toString()),
                          Text(gridItems[3]["text"].toString())
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      )),
    ),
  );
}
