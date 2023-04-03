import 'package:flutter/material.dart';
import 'package:project_bfa/pages/bakers_charts.dart';
import 'package:project_bfa/pages/charts/add_charts.dart';
import 'package:project_bfa/pages/dairy_charts.dart';
import 'package:project_bfa/pages/factories_charts.dart';
import 'package:project_bfa/pages/general_stores.dart';
import 'package:project_bfa/pages/hotels_charts.dart';
import 'package:project_bfa/pages/shops_charts.dart';
import 'package:project_bfa/pages/wheel_charts.dart';

class OverviewScreen extends StatefulWidget {
  OverviewScreen({Key? key}) : super(key: key);

  @override
  _OverviewScreenState createState() => _OverviewScreenState();
}

class _OverviewScreenState extends State<OverviewScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        title: Text(
          "BFA Survey 2022",
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Container(
        margin: EdgeInsets.only(left: 10, top: 15, right: 10, bottom: 5),
        height: 800,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 10,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(
                  top: 20, left: 15, right: 15, bottom: 20),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height / 2),
                    crossAxisCount: 2,
                    crossAxisSpacing: 15,
                    mainAxisSpacing: 10),
                children: [
                  SizedBox(
                    child: InkWell(
                      child: Container(
                        color: Color(0xff90baf8),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/overview.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Text(
                                "Survey Overview",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyCharts()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      child: Container(
                        color: Color(0xffff5f2f),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/dairyfarm.png',
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Text(
                                "Dairy Farms",
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DairyCharts()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      child: Container(
                        color: Color.fromARGB(255, 1, 54, 14),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/departmental.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Text(
                                "Grocery Establishment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => GeneralCharts()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      child: Container(
                        color: Color(0xffb98bff),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/bakery.png',
                              width: 100.0,
                              height: 100.0,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Text(
                                "Confectionery Establishment",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BakersCharts()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      child: Container(
                        color: Color(0xfff58764),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/factories.png',
                              width: 80.0,
                              height: 80.0,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Text(
                                "Industries And Small Manufacturing Units",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => FactoriesCharts()),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    child: InkWell(
                      child: Container(
                        color: Color.fromARGB(138, 253, 220, 199),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/hotel.png',
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Text(
                                "Hotels/Restaurants/Canteens",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HotelsCharts()),
                        );
                      },
                    ),
                  ),
                 SizedBox(
                    child: InkWell(
                      child: Container(
                        color: Color.fromARGB(255, 255, 172, 183),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/images/shops.png',
                              width: 90.0,
                              height: 90.0,
                              fit: BoxFit.fill,
                            ),
                            Center(
                              child: Text(
                                "Other Food Businesses",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.white, letterSpacing: 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ShopCharts()),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
