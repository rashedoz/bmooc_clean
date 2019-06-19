import 'package:flutter/material.dart';
import 'package:bmooc_clean/widgets/onboarding_page.dart';
import 'package:bmooc_clean/utils/resource_links.dart';
import 'package:gradient_text/gradient_text.dart';

import 'package:bmooc_clean/widgets/nav_drwaer_widget.dart';

import 'package:bmooc_clean/pages/dashboard_page.dart';

//Global Variables
var highLightColor = Colors.grey[300]; //High Light Color On tap
var accentColor = Colors.blue[200];
var primaryColor = Colors.blue[100];




class NavbarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    //New Material app with drawer main material app doesnt have drawer initialized
    return new MaterialApp(
      //Hide Debug banner
      debugShowCheckedModeBanner: false,

      home:
          new NavBarPage(), //Splash screen on start then route to onboarding page
    );
  }
}

class NavBarPage extends StatelessWidget {
  NavBarPage({Key key}) : super(key: key);

  //Scaffold key for drawer navigation
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey();

  final String _userName = "Rashed Mazumder";
  final String _selectedCourse = "Class XII";

  @override
  Widget build(BuildContext context) {
    // Get width and height of the scren size
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return Scaffold(

      key: _scaffoldKey,  //key for drawer navigation

      //App drawer
      drawer: navDrawer(width, height, context,_userName,_selectedCourse, accentColor, highLightColor,primaryColor),
      
      body:dashboardBodyUpper(_scaffoldKey,width,height),
      
    );
  }
}


// class NavSectionContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     // Get width and height of the scren size
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;

//     return Container(
//       child: Scaffold(
//         body: Stack(
//           children: <Widget>[
//             Positioned(
//               width: width * 0.80,
//               height: height,
//               //Image backgroun nav
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                       child: Image.asset(AppAssets.appAssets.bgNavSection)),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

