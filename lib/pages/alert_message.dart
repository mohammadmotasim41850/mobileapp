import 'package:flutter/material.dart';
import 'package:project_bfa/pages/overviewScreen.dart';

class AlertWithIcon extends StatefulWidget {
  AlertWithIconWidget createState() => AlertWithIconWidget();
}

class AlertWithIconWidget extends State {
  showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Row(children: [Text('  Alert Dialog. ')]),
          content: Text("Are You Sure Want To Proceed?"),
          actions: <Widget>[
            ElevatedButton(
              child: Text("YES"),
              onPressed: () {
                //Put your code here which you want to execute on Yes button click.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OverviewScreen()),
                );
              },
            ),
            ElevatedButton(
              child: Text("CANCEL"),
              onPressed: () {
                //Put your code here which you want to execute on Cancel button click.
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        centerTitle: true,
        title: Text("BFA Survey Message"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: Image.asset(
                'assets/images/message.png',
                height: 550,
                fit: BoxFit.fill,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 30),
              child: ElevatedButton(
                        child: Text('Click to Move to Survey Records'),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => OverviewScreen()),
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
    );
  }
}
