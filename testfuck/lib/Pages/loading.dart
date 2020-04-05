import 'package:flutter/material.dart';
import 'package:testfuck/Service/get_the_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void set_time() async {
    WorldTime ins = WorldTime(
        flag: 'germany.png', location: 'Berlin', url: 'Europe/Berlin');
    await ins.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'flag': ins.flag,
      'location': ins.location,
      'time': ins.time,
      'isdaytime': ins.IsDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    set_time();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: SpinKitRotatingCircle(
        color: Colors.white,
        size: 50.0,
      ),
    );
  }
}
