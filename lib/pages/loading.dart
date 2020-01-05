import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void setupWorldTime() async {
    WorldTime instance = WorldTime(
        location: '中国',
        flag: 'china.png',
        url: 'Asia/Shanghai'
    );
    await instance.getTime();

    Future.delayed(const Duration(milliseconds: 1000), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        'time': instance.time,
        'location': instance.location,
        'flag': instance.flag,
        'isDayTime': instance.isDayTime
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setupWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Center(
        child: SpinKitSquareCircle(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
