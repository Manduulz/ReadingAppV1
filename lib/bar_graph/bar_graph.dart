import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:readingappv1/bar_graph/bar_data.dart';

class MyBarGraph extends StatefulWidget {
  final List weeklySummary;
  MyBarGraph({super.key, required this.weeklySummary});

  @override
  State<MyBarGraph> createState() => _MyBarGraphState();
}

class _MyBarGraphState extends State<MyBarGraph> {
  @override
  Widget build(BuildContext context) {
    BarData myBarData = BarData(
      monAmount: widget.weeklySummary[0],
      tueAmount: widget.weeklySummary[1],
      wedAmount: widget.weeklySummary[2],
      thuAmount: widget.weeklySummary[3],
      friAmount: widget.weeklySummary[4],
      satAmount: widget.weeklySummary[5],
      sunAmount: widget.weeklySummary[6],
    );
    myBarData.initializeBarData();
    return BarChart(
      BarChartData(
        maxY: 150,
        minY: 0,
        gridData: FlGridData(show: false),
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
          showTitles: true,
          getTitlesWidget: getBottomTitles,
        ))),
        barGroups: myBarData.barData
            .map(
              (data) => BarChartGroupData(x: data.x, barRods: [
                BarChartRodData(
                    toY: data.y,
                    color: Colors.blue,
                    width: 10,
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true, toY: 150, color: Colors.grey)),
                BarChartRodData(
                    toY: data.y,
                    color: Color(0xffFF9501),
                    width: 10,
                    backDrawRodData: BackgroundBarChartRodData(
                        show: true, toY: 150, color: Colors.grey)),
              ]),
            )
            .toList(),
      ),
    );
  }
}

Widget getBottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(
    color: Colors.grey,
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  Widget text;
  switch (value.toInt()) {
    case 1:
      text = Text('Да', style: style);
      break;
    case 2:
      text = Text('Мя', style: style);
      break;
    case 3:
      text = Text('Лх', style: style);
      break;
    case 4:
      text = Text('Пү', style: style);
      break;
    case 5:
      text = Text('Ба', style: style);
      break;
    case 6:
      text = Text('Бя', style: style);
      break;
    case 7:
      text = Text('Ня', style: style);
      break;

    default:
      text = Text('', style: style);
  }
  return SideTitleWidget(
    child: text,
    axisSide: meta.axisSide,
  );
}
