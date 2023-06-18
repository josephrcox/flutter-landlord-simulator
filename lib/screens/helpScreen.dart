import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

// stateless widget
class HelpScreen extends StatefulWidget {
  HelpScreen({Key? key, required this.economy, required this.day})
      : super(key: key);

  List<double> economy;
  int day;

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    // average out the List by only using every 10th value
    widget.economy = widget.economy
        .asMap()
        .entries
        .where((e) => e.key % 20 == 0)
        .map((e) => e.value)
        .toList();

    // do every value 10 times so [1,2] becomes [1,1,1,1,1,1,1,1,1,1,2,2,2,2,2...]
    widget.economy = widget.economy.expand((e) => List.filled(20, e)).toList();

    // truncate so that it only shows days in the past
    // widget.economy = widget.economy.sublist(0, widget.day);

    return Scaffold(
        // app bar
        appBar: AppBar(
          title: const Text('How to play'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: AspectRatio(
            aspectRatio: 1,
            child: LineChart(
              LineChartData(
                maxX: widget.economy.length.toDouble() - 1,
                minX: 0,
                minY: -1,
                maxY: 1,
                lineBarsData: [
                  LineChartBarData(
                    curveSmoothness: 0.01,
                      // for spots, use [index, value] from economy
                      spots: widget.economy
                          .asMap()
                          .entries
                          .map((e) => FlSpot(e.key.toDouble(), e.value))
                          .toList(),
                      isCurved: true,
                      dotData: const FlDotData(
                        show: false,
                      ),
                      color: Colors.red),
                ],
                // borderData: FlBorderData(
                //     border:
                //         const Border(bottom: BorderSide(), left: BorderSide())),
                gridData: const FlGridData(show: false),
                titlesData: FlTitlesData(
                  leftTitles: AxisTitles(
                    sideTitles: leftTitles(),
                  ),
                  topTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  rightTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: false)),
                  bottomTitles: const AxisTitles(
                      sideTitles: SideTitles(showTitles: true)),
                ),
              ),
            ),
          ),
        ));
  }
}

Widget leftTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 14,
  );
  String text;
  switch (value.toInt()) {
    case 1:
      text = 'Great';
      break;
    case 0:
      text = 'Fine';
      break;
    case -1:
      text = 'Bad';
      break;
    default:
      return Container();
  }

  return Text(text, style: style, textAlign: TextAlign.center);
}

SideTitles leftTitles() => SideTitles(
      getTitlesWidget: leftTitleWidgets,
      showTitles: true,
      interval: 1,
      reservedSize: 40,
    );

Widget bottomTitleWidgets(double value, TitleMeta meta) {
  const style = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
  );
  Widget text;
  switch (value.toInt()) {
    case 2:
      text = const Text('SEPT', style: style);
      break;
    case 7:
      text = const Text('OCT', style: style);
      break;
    case 12:
      text = const Text('DEC', style: style);
      break;
    default:
      text = const Text('');
      break;
  }

  return SideTitleWidget(
    axisSide: meta.axisSide,
    space: 10,
    child: text,
  );
}
