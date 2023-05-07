import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ielts_trainer/backend/models/mocktest_model.dart';

getMockTestWidget(List<MockTestModel> list, BuildContext context) {
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.15,
              child: Center(
                child: ListTile(
                  title: Text(
                    list[index].title,
                    style: GoogleFonts.openSans(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  subtitle: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        list[index].subt,
                        style: GoogleFonts.openSans(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      Text(
                        "Time ${list[index].time.toString()} min",
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                  trailing: Column(
                    children: [
                      const Icon(
                        Icons.workspace_premium,
                        color: Color.fromARGB(255, 233, 176, 31),
                      ),
                      Text(
                        "Upgrade",
                        style: GoogleFonts.openSans(
                          fontSize: 10,
                          color: Colors.blue,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  contentPadding: const EdgeInsets.all(16),
                  tileColor: Colors.grey[200],
                ),
              ),
            ),
          ),
        );
      });
}
