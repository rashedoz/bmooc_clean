import 'package:flutter/material.dart';
import 'package:bmooc_clean/utils/resource_links.dart';
import 'package:bmooc_clean/widgets/nav_drwaer_widget.dart';
import 'package:gradient_text/gradient_text.dart';

dashboardBodyUpper(scaffoldKey, width, height) {
  var gridButtonColor1 = Colors.yellow;
  var gridButtonColor2 = Colors.blue;
  String userFirstName = "Rashed";

  return Stack(children: [
    //BackGround Image
    Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage(AppAssets.appAssets.bgNavSection),
          fit: BoxFit.cover,
        ),
      ),
    ),

    ListView(
      padding: const EdgeInsets.only(top: 8.0),
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        //Hello text
        Container(
          padding:
              EdgeInsets.only(top: height * .2, left: width * .05, bottom: 20),
          width: 150,
          ////Title text
          child: Align(
            alignment: Alignment.centerLeft,
            child: GradientText(
              "Hello,\n$userFirstName",
              textAlign: TextAlign.start,
              gradient: LinearGradient(
                colors: [
                  Colors.black,
                  Colors.grey[300]
                ], //Gradient of title text
              ),
              style: TextStyle(
                fontSize: 35,
                letterSpacing: 0.3,
              ),
            ),
          ),
        ),

        //Grid buttons
        ClipRRect(
          borderRadius: BorderRadius.circular(25.0),
          child: Card(
            elevation: 5,
            child: Container(
              //Card Background
              decoration: new BoxDecoration(
                color: Colors.purple,
                gradient: new LinearGradient(
                    colors: [Color(0xFFe0e8f9), Colors.white],
                    begin: Alignment.centerRight,
                    end: Alignment.centerLeft),
              ),

              child: Container(
                padding: EdgeInsets.only(top: height * 0.03),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(right: 5),
                          width: 150,
                          height: 90,
                          child: courseSelectBtn(
                              gridButtonColor1, gridButtonColor2),
                        ),
                        Container(
                          padding: EdgeInsets.only(left: 5),
                          width: 150,
                          height: 90,
                          child: courseSelectBtn(
                              gridButtonColor1, gridButtonColor2),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            width: 160,
                            height: 90,
                            child: courseSelectBtn(
                                Colors.yellow, gridButtonColor2),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 20,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),

        //Recently learned card
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Card(
              elevation: 5,
              child: new Container(
                //Card Background
                decoration: new BoxDecoration(
                  color: Colors.purple,
                  gradient: new LinearGradient(
                      colors: [Color(0xFFe0e8f9), Colors.white],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                padding: new EdgeInsets.all(32.0),
                child: new Row(
                  children: <Widget>[
                    applyGradientToIcon(Icon(Icons.book, size: 40.0)),

                    //Card Text
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 150,
                      child: applyGradientToIcon(Text(
                        'Find your recently learned topics!',
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.3,
                        ),
                      )),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: width * 0.06),
                      child: FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Color(0xFF6657e5),
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        //Share This App
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25.0),
            child: Card(
              elevation: 5,
              child: new Container(
                //Card Background
                decoration: new BoxDecoration(
                  color: Colors.purple,
                  gradient: new LinearGradient(
                      colors: [Color(0xFFe0e8f9), Colors.white],
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft),
                ),
                padding: new EdgeInsets.all(32.0),
                child: new Row(
                  children: <Widget>[
                    applyGradientToIcon(Icon(Icons.share, size: 40.0)),

                    //Card Text
                    Container(
                      padding: EdgeInsets.only(left: 20),
                      width: 150,
                      child: applyGradientToIcon(Text(
                        'Share with your friend!',
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.3,
                        ),
                      )),
                    ),

                    Container(
                      padding: EdgeInsets.only(left: width * 0.06),
                      child: FloatingActionButton(
                        heroTag: null,
                        backgroundColor: Color(0xFF6657e5),
                        onPressed: () {},
                        child: Icon(
                          Icons.arrow_forward,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),

        //Top Icon Button

        Container(
          padding: EdgeInsets.only(top: 30, bottom: 50),
          child: FloatingActionButton(
            heroTag: null,
            backgroundColor: Color(0xFF6657e5),
            onPressed: () {},
            child: Icon(
              Icons.arrow_upward,
              size: 30,
            ),
          ),
        ),

        //Recently learned card
      ],
    ),

    Positioned(
      left: width * .03,
      top: height * .07,
      child: Container(
        height: width * .13,
        width: height * .13,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () {
              scaffoldKey.currentState.openDrawer();
            },
            child: Icon(Icons.menu),
          ),
        ),
      ),
    ),
  ]);
}

courseSelectBtn(gridButtonColor1, gridButtonColor2) {
  return SizedBox(
    // width: 100,
    // height: 100,
    child: RaisedButton(
        textColor: Colors.white,
        color: Color(0xFF9ea6ef),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            applyGradientToIconwithGradient(
                Icon(
                  Icons.video_library,
                  color: Colors.white,
                ),
                gridButtonColor1,
                gridButtonColor2),
            applyGradientToIconwithGradient(
                Text(
                  'Watch Videos',
                ),
                Colors.white,
                Colors.grey)
          ],
        ),

        //Route to navbar page (next pageview isn't implemented)
        onPressed: () {},
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(10.0))),
  );
}
