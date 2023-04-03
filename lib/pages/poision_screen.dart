import 'package:flutter/material.dart';
import 'package:project_bfa/pages/main_poision.dart';


class PoisionScreen extends StatefulWidget {
  PoisionScreen({Key? key}) : super(key: key);

  @override
  _PoisionScreenState createState() => _PoisionScreenState();
}

class _PoisionScreenState extends State<PoisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            child: Image.asset(
              'assets/images/medicalbackground.png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          child: Container(
                            child: Image.asset(
                              'assets/images/logo.png',
                              scale: 0.4,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 23),
                        child: Container(
                          child: Image.asset(
                            'assets/images/bismillah.png',
                            height: 110,
                            scale: 0.4,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: Container(
                        child: Image.asset(
                          'assets/images/foodpoi.png',
                          width: 330,
                          scale: 0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                    ),
                    Center(
                      child: ElevatedButton(
                        child: Text('Submission'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PoisionReg()),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.lightGreen),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(25)),
                          textStyle: MaterialStateProperty.all(
                              TextStyle(fontSize: 18)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
