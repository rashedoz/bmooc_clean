import 'package:flutter/material.dart';
import 'package:bmooc_clean/pages/pages.dart';

import 'package:gradient_text/gradient_text.dart';
import 'package:bmooc_clean/widgets/page_indicator.dart';

import 'package:bmooc_clean/pages/navbar_page.dart';

//Onboarding page class
class OnBoardingPage extends StatefulWidget {
  @override
  _OnBoardingState createState() => new _OnBoardingState();
}

class _OnBoardingState extends State<OnBoardingPage> {
  PageController _controller;
  int currentpage = 0;

  String _nextBtnText = "Next";

  //Change Button String and setState for page change
  void _onPageChanged(int index) {
    setState(() {
      //Set State
      currentpage = index;

      if (currentpage == 2) {
        _nextBtnText = "Get Started";
      } else {
        _nextBtnText = "Next";
      }
    });
  }

  @override
  void initState() {
    super.initState();
    //initialize current page
    _controller = PageController(initialPage: currentpage);
  }

  //Dispose page controller
  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  //Next button page controller
  void _onForwordButtonPressed() {
    if (currentpage < 2) {
      _controller.animateToPage((currentpage + 1),
          duration: Duration(milliseconds: 500), curve: Curves.ease);
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => NavbarWidget()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //Decorations background
      decoration: BoxDecoration(
        gradient: LinearGradient(

            //Gradient colors
            colors: [Colors.white, Colors.blue[50]],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            tileMode: TileMode.clamp,
            stops: [0.0, 1.0]),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            //single PageView builder
            PageView.builder(
                itemCount: pageList.length, //Total items in page list
                controller: _controller,
                onPageChanged: _onPageChanged,
                itemBuilder: (context, index) {
                  return Stack(
                    fit: StackFit.expand,
                    children: <Widget>[
                      AnimatedBuilder(
                        animation: _controller,
                        builder: (context, child) {
                          var page = pageList[index]; //current page index

                          //Text animation variables
                          var delta;
                          var y = 1.0;

                          //80% of screen width
                          double containerWidth =
                              MediaQuery.of(context).size.width * 0.8;

                          //Animation of text according to page generator
                          if (_controller.position.haveDimensions) {
                            delta = _controller.page - index;
                            y = 1 - delta.abs().clamp(0.0, 1.0);
                          }

                          //Return current page content
                          return Stack(
                            children: <Widget>[
                              //Image asset background
                              Container(
                                decoration: new BoxDecoration(
                                  image: new DecorationImage(
                                    image: new AssetImage(page.imageUrl),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                              //Text Body and title stack
                              Stack(
                                children: <Widget>[
                                  //Text Container
                                  Positioned(
                                    bottom: 200,
                                    left: 50,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        //Background faded text
                                        /*
                                        Opacity(
                                          opacity: .10,
                                          child: GradientText(
                                            page.title,
                                            gradient: LinearGradient(
                                              colors: page.titleGradient,
                                            ),
                                            style: TextStyle(
                                              fontSize: 50,
                                              fontFamily: "Montserrat-Black",
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                        ),*/

                                        //Title text
                                        Align(
                                          alignment: Alignment.center,
                                          child: GradientText(
                                            page.title,
                                            textAlign: TextAlign.center,
                                            gradient: LinearGradient(
                                              colors: page.titleGradient,
                                            ),
                                            style: TextStyle(
                                              fontSize: 40,
                                              letterSpacing: 0.3,
                                            ),
                                          ),
                                        ),

                                        //Body text
                                        Container(
                                          padding: const EdgeInsets.only(
                                              top: 6.0, left: 22.0, right: 10),
                                          width:
                                              containerWidth, //wrap long text in 80% width
                                          //Body Text Transform Animation
                                          child: Transform(
                                            transform:
                                                Matrix4.translationValues(
                                                    0, 50.0 * (1 - y), 0),
                                            child: Text(
                                              page.body,
                                              style: TextStyle(
                                                fontSize: 20,
                                                letterSpacing: 0.3,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
                      )
                    ],
                  );
                }),

            /*Outside page viewbuilder static element */

            //Welcome Button
            Positioned(
              right: 50.0,
              bottom: 70.0,
              child: SizedBox(
                width: 150,
                height: 40,
                child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.blue[300],
                    child: Text(_nextBtnText),
                    //Route to navbar page (next pageview isn't implemented)
                    onPressed: _onForwordButtonPressed,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0))),
              ),
            ),

            //Positioned indicator
            Positioned(
              left: 30.0,
              bottom: 80.0,
              child: Container(
                  width: 80.0,
                  child: PageIndicator(currentpage, pageList.length)),
            ),
          ],
        ),
      ),
    );
  }
}
