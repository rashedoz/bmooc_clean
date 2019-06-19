import 'package:flutter/material.dart';
import 'package:bmooc_clean/widgets/onboarding_page.dart';
import 'package:gradient_text/gradient_text.dart';
import 'package:bmooc_clean/utils/resource_links.dart';


//Icon gradient function
applyGradientToIcon(icon) {
  return ShaderMask(
    child: icon,
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors: [Color(0xFF5f19d1),Color(0xFF796de8) ],
        stops: [
          0.0,
          0.001,
        ],
      ).createShader(bounds);
    },
    blendMode: BlendMode.srcATop,
  );
}

//Icon gradient function
applyGradientToIconwithGradient(icon,gradient1,gradient2) {
  return ShaderMask(
    child: icon,
    shaderCallback: (Rect bounds) {
      return LinearGradient(
        colors: [gradient1,gradient2],
        stops: [
          0.0,
          0.5,
        ],
      ).createShader(bounds);
    },
    blendMode: BlendMode.srcATop,
  );
}

navDrawer(width, height, context, userName, selectedCourse,accentColor, highLightColor,primaryColor){
  return Theme(
        data: Theme.of(context).copyWith(
          accentColor: accentColor,
          primaryColor: primaryColor,

          // Set the transparency here
          canvasColor: Colors.white.withOpacity(
              0.8), //or any other color you want. e.g Colors.blue.withOpacity(0.5)
        ),
        child: Container(
          //Drawer Background Image
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage(AppAssets.appAssets.bgNavSection),
              fit: BoxFit.cover,
            ),
          ),

          // Nav Drawer Widget
          child: navDrawerWidget(width,height,context,userName,selectedCourse,accentColor,highLightColor) 
          ),  
      );

}

//Navdrawer widget body
navDrawerWidget(width, height, context, userName,selectedCourse, accentColor, highLightColor) {
  return Drawer(
    child: Container(
      child: Stack(
        children: <Widget>[
          //Top drawer items avata an name
          Positioned(
            top: height * .07,
            left: width * .05,
            child: Stack(children: <Widget>[
              Column(
                children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    //Drawer avatar image
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        backgroundImage:
                            AssetImage(AppAssets.appAssets.watermelonAvatar),
                      ),
                    ),
                  ),
                  Container(
                    width: 150,
                    ////Title text
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: GradientText(
                        userName,
                        textAlign: TextAlign.start,
                        gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.grey[850]
                          ], //Gradient of title text
                        ),
                        style: TextStyle(
                          fontSize: 25,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),

                 

                ],
              ),
              Container(
                    width: 100,
                    
                    ////Title text
                    child: Align(
                      alignment: Alignment.center,
                      child: GradientText(
                        selectedCourse,
                        textAlign: TextAlign.start,
                        gradient: LinearGradient(
                          colors: [
                            Colors.grey,
                            Colors.grey[850]
                          ], //Gradient of title text
                        ),
                        style: TextStyle(
                          fontSize: 15,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ),
                  ),
                ],)
            ]),
          ),

          //Drawer Floating arrow Button
          Stack(children: <Widget>[
            Positioned(
              right: width * .005,
              top: height * .1,
              child: Container(
                height: width * .13,
                width: height * .13,
                child: FittedBox(
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Icon(Icons.arrow_forward),
                  ),
                ),
              ),
            ),
          ]),

          //Drawer Icon tiles
          Padding(
            padding: const EdgeInsets.only(top: 110),
            child: Container(
              child: Theme(
                data: ThemeData(
                  accentColor: accentColor,
                  highlightColor: highLightColor,
                ),
                child: ListView(
                  children: <Widget>[
                    InkWell(
                      child: ListTile(
                        title: Text("Notifications"),
                        leading: applyGradientToIcon(Icon(Icons.notifications)),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: ListTile(
                        title: Text("Quizzes"),
                        leading:
                            applyGradientToIcon(Icon(Icons.question_answer)),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: ListTile(
                        title: Text("Share this App"),
                        leading: applyGradientToIcon(Icon(Icons.share)),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: ListTile(
                        title: Text("Parent Connect"),
                        leading: applyGradientToIcon(Icon(Icons.people)),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: ListTile(
                        title: Text("Contact Us"),
                        leading: applyGradientToIcon(Icon(Icons.contacts)),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: ListTile(
                        title: Text("Subscribe Now"),
                        leading: applyGradientToIcon(Icon(Icons.subscriptions)),
                      ),
                      onTap: () {},
                    ),
                    InkWell(
                      child: ListTile(
                        title: Text("Terms & Conditions"),
                        leading: applyGradientToIcon(Icon(Icons.info)),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),

          //Nav Drawer Button
          Positioned(
            left: width * 0.05,
            bottom: height * 0.02,
            child: SizedBox(
              width: 250,
              height: 50,
              child: RaisedButton(
                  textColor: Colors.white,
                  color: Colors.blue[300],
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.home,
                        color: Colors.white,
                      ),
                      Text(
                        'Watch Videos',
                      ),
                    ],
                  ),
                  //Route to navbar page (next pageview isn't implemented)
                  onPressed: () {
                    
                  },
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0))),
            ),
          ),
        ],
      ),
    ),
  );
}
