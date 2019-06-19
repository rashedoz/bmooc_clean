import 'package:flutter/material.dart';

var pageList = [
  PageModel(
    imageUrl: "images/Mask_1.png",
    title: "BMOOC",
    body: "Bangladesh Massive Open Online Courses",
    titleGradient: gradients[0]
    ),
  PageModel(
    imageUrl: "images/Mask_2.png",
    title: "Online Courses",
    body: "Enjoy reading Courses",
    titleGradient: gradients[1]
    ),
  PageModel(
    imageUrl: "images/onboard_3.png",
    title: "FLexibility",
    body: "Watch in your own time",
    titleGradient: gradients[2]
    ),
];




//Pagemodel gradient colors list
List<List<Color>> gradients = [
  [Color(0xFF90DEF7), Color(0xFF0B9ACA)],
  [Color(0xFF90DEF7), Color(0xFF0B9ACA)],
  [Color(0xFF90DEF7), Color(0xFF0B9ACA)],
];


// PageModel CLass
class PageModel {
  var imageUrl;
  var title;
  var body;
  List<Color> titleGradient = [];
  PageModel({this.imageUrl, this.title, this.body, this.titleGradient});
}
