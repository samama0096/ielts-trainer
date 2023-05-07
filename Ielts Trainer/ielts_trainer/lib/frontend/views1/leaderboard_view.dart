import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class LeaderboardView extends StatefulWidget {
  const LeaderboardView({super.key});

  @override
  State<LeaderboardView> createState() => _LeaderboardViewState();
}

class _LeaderboardViewState extends State<LeaderboardView> {
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          child: Icon(
            Icons.leaderboard_rounded,
            size: 100,
            color: Colors.teal[200],
          ),
        ),
        SizedBox(
          height: s.height * 0.6,
          child: DataTable2(dividerThickness: 1, columns: const [
            DataColumn(
              label: Text('Rank'),
            ),
            DataColumn(
              label: Text('Name'),
            ),
            DataColumn(
              label: Text('Marks'),
            ),
            DataColumn(
              label: Text('Time'),
            ),
          ], rows: const [
            DataRow(cells: [
              DataCell(Text('1')),
              DataCell(Text('Nouman')),
              DataCell(Text('30/180')),
              DataCell(Text('00:50')),
            ]),
            DataRow(cells: [
              DataCell(Text('2')),
              DataCell(Text('Samama')),
              DataCell(Text('33/180')),
              DataCell(Text('00:10')),
            ]),
            DataRow(cells: [
              DataCell(Text('3')),
              DataCell(Text('Ayan')),
              DataCell(Text('88/180')),
              DataCell(Text('00:40')),
            ])
          ]),
        )
      ],
    ));
  }
}
