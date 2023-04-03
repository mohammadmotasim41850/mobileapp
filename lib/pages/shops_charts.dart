import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;

class ShopCharts extends StatefulWidget {
  @override
  State<ShopCharts> createState() => _ShopChartsState();
}

class _ShopChartsState extends State<ShopCharts> {
  List<SalesDetails> sales = [];
  late TooltipBehavior _tooltipBehavior;

  Future<String> getJsonFromFirebase() async {
    String url =
        'https://shopcharts-1479e-default-rtdb.firebaseio.com/data.json';
    http.Response response = await http.get(Uri.parse(url));
    return response.body;
  }

  Future loadSalesData() async {
    final String jsonString = await getJsonFromFirebase();
    final dynamic jsonResponse = json.decode(jsonString);
    for (Map<String, dynamic> i in jsonResponse) {
      sales.add(SalesDetails.fromJson(i));
    }
  }

  @override
  void initState() {
    loadSalesData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: [
          Scaffold(
            body: FutureBuilder(
              future: getJsonFromFirebase(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 180),
                    child: (SfCircularChart(
                        title: ChartTitle(
                            text:
                                "Balochistan Food Authority \n Graphically Representation of Field Survey of Food Handlers uptill now"),
                        legend: Legend(
                            isVisible: true,
                            borderColor: Colors.black,
                            borderWidth: 2,
                            // Overflowing legend content will be wraped
                            overflowMode: LegendItemOverflowMode.wrap),
                        tooltipBehavior: _tooltipBehavior,
                        series: <CircularSeries>[
                          // Render pie chart
                          PieSeries<SalesDetails, String>(
                              dataSource: sales,
                              xValueMapper: (SalesDetails details, _) =>
                                  details.shopname,
                              yValueMapper: (SalesDetails details, _) =>
                                  details.shopsCount,
                              explode: true,
                              name: 'Data',
                              radius: '80%',
                              dataLabelSettings:
                                  DataLabelSettings(isVisible: true))
                        ])),
                  );
                } else {
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Positioned(
            top: 610,
            child: Container(
              child: Image.asset(
                'assets/images/boardimage.jpeg',
                width: 360,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SalesDetails {
  SalesDetails(this.shopname, this.shopsCount);
  final String shopname;
  final int shopsCount;
  factory SalesDetails.fromJson(Map<String, dynamic> parsedJson) {
    return SalesDetails(
        parsedJson['shopname'].toString(), parsedJson['shopsCount']);
  }
}
