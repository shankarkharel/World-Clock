import 'package:World_Clock/Services/WorldTime.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void getWorldTime() async {
    //String location = "Asia/Kathmandu";
    //String location = ModalRoute.of(context).settings.arguments;
    //print(location);
    WorldTime instanse = WorldTime(location: "Asia/Kathmandu");
    print(instanse);
    await instanse.getTime();

    Navigator.pushReplacementNamed(context, "/home", arguments: {
      'location': instanse.location,
      'isDay': instanse.isDay,
      'time': instanse.time,
    });
  }

  @override
  void initState() {
    super.initState();
    getWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        backgroundColor: Colors.blue[900],
        body: (SpinKitSquareCircle(
          color: Colors.white,
          size: 70.0,
        )),
      ),
    );
  }
}
