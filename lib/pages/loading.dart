import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../services/world_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  
  void setupWorldTime() async {
    WorldTime instance= WorldTime(location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': instance.location,
      'flag':instance.flag,
      'time': instance.time,
      'isDaytime': instance.isDaytime,
    });

  }


  @override
  void initState() {
    super.initState();
    setupWorldTime();


  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      body: Center(
        child: SpinKitSpinningLines(
            color: Colors.white,
            size: 50.0,
          ),
      )

    );
  }
}
