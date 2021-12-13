import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartPage extends StatefulWidget {
  PieChartPage({Key key}) : super(key: key);

  @override
  _PieChartPageState createState() => _PieChartPageState();
}

class _PieChartPageState extends State<PieChartPage> {
  List<PieChartSectionData> sectionsChart = [
    PieChartSectionData(
      value: 35,
      title: "35%",
      showTitle: true,
      color: Colors.orange,
      radius: 100,
    ),
    PieChartSectionData(
      value: 45,
      title: "45%",
      showTitle: true,
      color: Colors.blue,
      radius: 100,
    ),
    PieChartSectionData(
      value: 15,
      title: "15%",
      showTitle: true,
      color: Colors.red,
      radius: 100,
    ),
    PieChartSectionData(
      value: 5,
      title: "5%",
      showTitle: true,
      color: Colors.purple,
      radius: 100,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Pie Chart"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                width: MediaQuery.of(context).size.width,
                child: buildChart(context)),
            buildDots()
          ],
        ));
  }

  Container buildDots() {
    return Container(
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: dotsList()),
    );
  }

  Container buildChart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 300,
      child: PieChart(
        PieChartData(
            borderData: FlBorderData(
              show: false,
            ),
            sectionsSpace: 0,
            centerSpaceRadius: 0,
            sections: sectionsChart),
      ),
    );
  }

  List<Widget> dotsList() {
    List<Widget> list = [];

    for (var item in sectionsChart) {
      list.add(Container(
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  color: item.color, borderRadius: BorderRadius.circular(100)),
            ),
            SizedBox(
              width: 10,
            ),
            Container(
              child: Text(item.title),
            )
          ],
        ),
      ));
    }

    return list;
  }
}
