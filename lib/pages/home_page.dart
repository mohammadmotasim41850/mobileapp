import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:project_bfa/license_start.dart';
import 'package:project_bfa/pages/alert_message.dart';
import 'package:project_bfa/pages/challan_start.dart';
import 'package:project_bfa/pages/complain_start.dart';
import 'package:project_bfa/pages/license_registration.dart';
import 'package:project_bfa/pages/medical_screening.dart';
import 'package:project_bfa/pages/poision_screen.dart';
import 'package:project_bfa/pages/product_registration.dart';
import 'package:project_bfa/pages/start_medical_screening.dart';
import 'package:project_bfa/pages/start_newsscreen.dart';
import 'package:url_launcher/url_launcher.dart';

const String _url = 'https://bfa.gob.pk/';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  

  @override
  Widget build(BuildContext context) {
    Future<bool> showExitPopup() async {
      return await showDialog(
            //show confirm dialogue
            //the return value will be from "Yes" or "No" options
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Exit App'),
              content: Text('Do you want to exit an App?'),
              actions: [
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(false),
                  //return false when click on "NO"
                  child: Text('No'),
                ),
                ElevatedButton(
                  onPressed: () => Navigator.of(context).pop(true),
                  //return true when click on "Yes"
                  child: Text('Yes'),
                ),
              ],
            ),
          ) ??
          false; //if showDialouge had returned null, then return false
    }

    final Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: showExitPopup,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          title: Text(
            "Balochistan Food Authority",
          ),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
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
                          color: Color(0xffb17815),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.food_bank,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "Food Poisoning Complaints",
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
                                builder: (context) => PoisionScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xffa33e3e),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.feedback,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "Submit Complaints",
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
                                builder: (context) => ComplainScreen()),
                          );
                        },
                      ),
                    ),
                     SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xff2a7e59),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.app_registration,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "License Registration",
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
                                builder: (context) => LicenseScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xffb17815),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.app_registration,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "Product Registration",
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
                                builder: (context) => ProductScreen()),
                          );
                        },
                      ),
                    ),
                     SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xff451f57),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.receipt,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "My Challans",
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
                                builder: (context) => ChallanScreens()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xffb22900),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.search, size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "License Verification",
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
                                builder: (context) => licenScreens()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xffa33e3e),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.bar_chart,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "Survey Records",
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
                                builder: (context) => AlertWithIcon()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xff20354f),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.new_releases,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "News",
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
                                builder: (context) => NewsScreen()),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xff451f57),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.web, size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "Web Portal",
                                  style: TextStyle(
                                      color: Colors.white, letterSpacing: 0.5),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: _launchURL,
                      ),
                    ),
                    SizedBox(
                      child: InkWell(
                        child: Container(
                          color: Color(0xff2a7e59),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.medical_services,
                                  size: 40, color: Colors.white),
                              Center(
                                child: Text(
                                  "Medical Screenings",
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
                                builder: (context) => MedicalScreen()),
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
      ),
    );
  }
}

void _launchURL() async {
  if (!await launch(_url)) throw 'Could not launch $_url';
}
