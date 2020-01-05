import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};

  @override
  Widget build(BuildContext context) {

    String getBgImg (data) {
      String bgImg;
      bool isDay = data['isDayTime'];
      String location = data['location'];
      switch(location){
        case '中国':
          if(isDay){
            bgImg = 'images/china-day-0.jpg';
          } else {
            bgImg = 'images/china-night.jpg';
          }
          break;
        case '英国':
          if(isDay){
            bgImg = 'images/london-day.jpg';
          } else {
            bgImg = 'images/london-night.jpg';
          }
          break;
      }
      return bgImg;
    }

    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String bgImg = getBgImg(data);
    Color fColor = data['isDayTime'] ? Colors.black : Colors.white;

    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(bgImg),
              fit: BoxFit.cover,
            )
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                FlatButton.icon(
                  onPressed: () async {
                    dynamic result = await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result['flag'],
                      };
                    });
                  },
                  icon: Icon(Icons.edit_location, color: fColor),
                  label: Text(
                    '地址',
                    style: TextStyle(
                      color: fColor
                    )
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data['location'],
                      style: TextStyle(
                        color: fColor,
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: fColor,
                    fontSize: 66.0,
                  ),
                ),
              ],
            ),
          ),
        )
      )
    );
  }
}
