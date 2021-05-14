import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class LineReportCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2.2,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: FlTitlesData(show: false),
          lineBarsData: [
            LineChartBarData(
              spots: getSports(),
              isCurved: true,
              dotData: FlDotData(show: false),
              colors: [kPrimaryColor],
              barWidth: 4,
            )
          ],
        ),
      ),
    );
  }
}

List<FlSpot> getSports() {
  return [
    FlSpot(0, 0.1),
    FlSpot(1, 0.3),
    FlSpot(2, 0.7),
    FlSpot(3, 0.5),
    FlSpot(4, 1),
    FlSpot(5, 1.2),
    FlSpot(6, 1.5),
    FlSpot(7, .3),
    FlSpot(8, .4),
    FlSpot(9, 1),
    FlSpot(10, .8),
    FlSpot(11, 2.1),
  ];
}
