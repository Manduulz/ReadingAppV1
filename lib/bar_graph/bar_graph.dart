import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:readingappv1/bar_graph/bar_data.dart';

class MyBarGraph extends StatefulWidget {
  final List weeklySummary;
  final List daySummary;
  const MyBarGraph({
    super.key,
    required this.weeklySummary,
    required this.daySummary,
  });
  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  @override
  Widget build(BuildContext context) {
    BarData weeklyBarData = BarData(
      monAmount: widget.weeklySummary[0],
      tueAmount: widget.weeklySummary[1],
      wedAmount: widget.weeklySummary[2],
      thuAmount: widget.weeklySummary[3],
      friAmount: widget.weeklySummary[4],
      satAmount: widget.weeklySummary[5],
      sunAmount: widget.weeklySummary[6],
    );
    weeklyBarData.initializeWeekBarData();
    // DayBarData dayBarData = DayBarData(
    //   moAmount: widget.daySummary[0],
    //   tuAmount: widget.daySummary[1],
    //   weAmount: widget.daySummary[2],
    //   thAmount: widget.daySummary[3],
    //   frAmount: widget.daySummary[4],
    //   saAmount: widget.daySummary[5],
    //   suAmount: widget.daySummary[6],
    // );
    // dayBarData.initializeDayBarData();
    return Padding(
      padding: const EdgeInsets.all(10),
      child: BarChart(
        BarChartData(
          maxY: 150,
          minY: 0,
          gridData: const FlGridData(show: false),
          borderData: FlBorderData(show: false),
          titlesData: const FlTitlesData(
              leftTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              topTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: false,
              )),
              bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: getBottomTitles,
              ))),
          groupsSpace: 10,
          barGroups: weeklyBarData.barData
              .map(
                (data) => BarChartGroupData(x: data.x, barRods: [
                  BarChartRodData(
                      toY: data.y,
                      color: Colors.blue,
                      width: 10,
                      backDrawRodData: BackgroundBarChartRodData(
                          show: true, toY: 150, color: Colors.grey)),
                ]),
              )
              .toList(),
        ),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 10,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = const Text('Да', style: style);
      break;
    case 2:
      text = const Text('Мя', style: style);
      break;
    case 3:
      text = const Text('Лх', style: style);
      break;
    case 4:
      text = const Text('Пү', style: style);
      break;
    case 5:
      text = const Text('Ба', style: style);
      break;
    case 6:
      text = const Text('Бя', style: style);
      break;
    case 7:
      text = const Text('Ня', style: style);
      break;

    default:
      text = const Text('', style: style);
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: text,
  );
}
