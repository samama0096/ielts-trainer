import 'package:circular_chart_flutter/circular_chart_flutter.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../backend/models/pmaterial_model.dart';

getPMaterialWidget(List<PMaterial> list, BuildContext context) {
  final GlobalKey<AnimatedCircularChartState> chartKey =
      GlobalKey<AnimatedCircularChartState>();
  return ListView.builder(
      physics: const BouncingScrollPhysics(),
      itemCount: list.length,
      itemBuilder: (context, index) {
        final GlobalKey<AnimatedCircularChartState> chartKey =
            GlobalKey<AnimatedCircularChartState>();
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
                  trailing: list[index].isAi
                      ? Container(
                          height: 40,
                          width: 50,
                          decoration: BoxDecoration(
                              color: Colors.orange[200]!.withOpacity(0.9),
                              borderRadius: BorderRadius.circular(16)),
                          child: const Center(child: Text("AI")),
                        )
                      : null,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30))),
                  contentPadding: const EdgeInsets.all(16),
                  tileColor: Colors.grey[200],
                  leading: AnimatedCircularChart(
                    key: chartKey,
                    holeRadius: 20,
                    holeLabel:
                        "${((list[index].done / list[index].total) * 100).floor()}%",
                    size: const Size(70.0, 70.0),
                    initialChartData: <CircularStackEntry>[
                      CircularStackEntry(
                        <CircularSegmentEntry>[
                          CircularSegmentEntry(
                            (list[index].done / list[index].total) * 100,
                            const Color.fromARGB(255, 99, 235, 103),
                            rankKey: 'completed',
                          ),
                          CircularSegmentEntry(
                            100 -
                                ((list[index].done / list[index].total) * 100),
                            Colors.blueGrey[200],
                            rankKey: 'remaining',
                          ),
                        ],
                        rankKey: 'progress',
                      ),
                    ],
                    chartType: CircularChartType.Radial,
                    percentageValues: true,
                  ),
                ),
              ),
            ),
          ),
        );
      });
}
