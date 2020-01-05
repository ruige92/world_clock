import 'package:flutter/material.dart';
import 'package:world_clock/services/world_time.dart';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: '英国', flag: 'uk.png'),
    WorldTime(url: 'Asia/Shanghai', location: '中国', flag: 'china.png'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    // navigate back to home
    Navigator.pop(context, {
      'time': instance.time,
      'location': instance.location,
      'flag': instance.flag,
      'isDayTime': instance.isDayTime
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.grey[800],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, i) {
          return Card(
            child: ListTile(
              onTap: () {
                updateTime(i);
              },
              title: Text(locations[i].location)
            )
          );
        },
      )
    );
  }
}
