import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:marquee_text/marquee_direction.dart';
import 'package:project_bfa/pages/const.dart';
import 'package:project_bfa/pages/model.dart';
import 'package:project_bfa/pages/news_api.dart';
import 'package:project_bfa/pages/news_screen.dart';
import 'package:widget_marquee/widget_marquee.dart';
import 'package:carousel_images/carousel_images.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:marquee_text/marquee_text.dart';


class NewsPage extends StatefulWidget {
  const NewsPage({Key? key}) : super(key: key);

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  final List<String> listImages = [
    'https://i.ibb.co/drHm4KD/Mobile-App.png',
  ];

  List<NewsApiModel>? newsList;
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getNews().then((value) {
      setState(() {
        if (value.isNotEmpty) {
          newsList = value;
          isLoading = false;
        } else {
          print("List is Empty");
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = new DateTime.now();
    String formattedTime = DateFormat.jm().format(now);
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    final String formatted = formatter.format(now); //5:08 PM
    final Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEBF4FA),
        //backgroundColor: getColors[1],
        body: Container(
          decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/medicalbackground.png'),
            fit: BoxFit.cover,
          ),
        ),
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: size.height / 12,
                width: size.width / 1.1,
                child: Row(
                  children: [
                    SizedBox(
                      width: size.width / 4,
                    ),
                   /* Padding(
                      padding: const EdgeInsets.only(left: 25),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'BFA',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold,
                                color: Colors.white,
                                ),
                            children: <InlineSpan>[
                              TextSpan(
                                text: 'NEWS',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ) */
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Center(
                        child: Text.rich(
                          TextSpan(
                            text: 'BFA NEWS',
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold,
                                color: Colors.white,
                                ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                child: Text(
                  "Time: $formattedTime",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
              Container(
                child: Text(
                  "Date: $formatted",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                  ),
                ),
              ),
             
              isLoading
                  ? Container(
                      height: size.height / 20,
                      width: size.height / 20,
                      child: CircularProgressIndicator(),
                    )
                  : Expanded(
                      child: Container(
                        child: ListView.builder(
                          itemCount: newsList!.length,
                          itemBuilder: (context, index) {
                            return listItems(size, newsList![index]);
                          },
                        ),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  Widget listItems(Size size, NewsApiModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 8),
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => ReadingNews(
              model: model,
            ),
          ),
        ),
        child: Container(
          padding: EdgeInsets.only(bottom: 10),
          width: size.width / 1.15,
          child: Column(
            children: [
              Builder(
                builder: (context) {
                  return Container(
                    decoration: new BoxDecoration(color: Colors.lightGreen),
                    margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 30),
                    child: Container(
                width: 400,
                color: Colors.lightGreen,
                child: Column(
                  children: [
                    MarqueeText(
         text: TextSpan(
           text: model.title,
         ),
         style: GoogleFonts.lato(
                          textStyle: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                             ),
         speed: 20,
         marqueeDirection: MarqueeDirection.ltr,
       ),
                  ],
                ),
              ),
                  );
                }
              ),
              Stack(
                children: [
                  SizedBox(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.lightGreen,
                        //border: Border.all(width: 9, color: Colors.blue),
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.green,
                            offset: const Offset(0, 8),
                            spreadRadius: 5,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      width: size.width / 0.8,
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: Text(
                        model.description,
                        style: GoogleFonts.lato(
                          textStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  /*Padding(
                    padding: const EdgeInsets.only(top: 150),
                    child: Center(
                      child: Container(
                        child: Text("Notice",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                        ),
                      ),
                    ),
                  ), */
                  Padding(
                    padding: const EdgeInsets.only(top: 80),
                    child: Container(
                child: Column(
                    children: <Widget>[
                      SizedBox(height: 100),
                      CarouselImages(
                        scaleFactor: 0.7,
                        listImages: listImages,
                        height: 320.0,
                        borderRadius: 10.0,
                        cachedNetworkImage: true,
                        verticalAlignment: Alignment.bottomCenter,
                        onTap: (index) {
                          print('Tapped on page $index');
                        },
                      )
                    ],
                ),
              ),
                  ),
                ],
              ),
               
            ],
          ),
        ),
      ),
    );
  }
}
