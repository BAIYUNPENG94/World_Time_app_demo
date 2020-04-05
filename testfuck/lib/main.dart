import 'package:flutter/material.dart';
import 'package:testfuck/Pages/choose_location.dart';
import 'package:testfuck/Pages/home.dart';
import 'package:testfuck/Pages/loading.dart';

void main() => runApp(MaterialApp(
  routes: {
    '/' : (context) => Loading(),
    '/home' : (context) => Home(),
    '/chooselocation' : (context) => ChooseLocation(),
  },
));
