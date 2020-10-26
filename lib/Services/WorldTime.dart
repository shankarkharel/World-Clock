import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //place name
  String time; //local time
  String flag; //url for flag img
  String url = 'Asia/Kathmandu'; //for API EndPoint.
  bool isDay; //checks if it's day or night.

  WorldTime({this.location, this.flag, this.url, this.time});

  Future<void> getTime() async {
    try {
      Response response =
          await get("http://worldtimeapi.org/api/timezone/$location");
      Map dataMap = jsonDecode(response.body);
      print(dataMap);
      String datetime = dataMap['datetime'];
      String offset1;
      String offset2;

      print(datetime);
      if (dataMap["utc_offset"].length >= 6) {
        offset1 = dataMap["utc_offset"].substring(1, 3);
        offset2 = dataMap["utc_offset"].substring(4, 6);
      } else {
        offset1 = dataMap["utc_offset"].substring(1, 3);
      }
      DateTime now = DateTime.parse(datetime);
      //print(now);

      now = now.add(Duration(hours: int.parse(offset1)));
      now = now.add(Duration(minutes: int.parse(offset2)));

      time = DateFormat.jm().format(now);
      print(time);
      isDay = now.hour >= 6 && now.hour < 20 ? true : false;
    } catch (e) {
      print("Error Occours:$e");
      time = "Couldnot load data.";
    }
  }
}
