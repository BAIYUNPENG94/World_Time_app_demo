import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';


class WorldTime {
  String time;
  String flag;
  String url;
  String location;
  bool IsDayTime;

  WorldTime({this.flag, this.location, this.url});

  Future<void> getTime() async {
    try {
      Response response =
      await get("http://worldtimeapi.org/api/timezone/$url");
      Map data = jsonDecode(response.body);
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));
      IsDayTime = now.hour > 6 && now.hour < 17 ? true : false;
      time = DateFormat.jm().format(now);
    } catch (e) {
      print("can not load the data");
      time = 'OOPS! There are something wrong!';
    }
  }
}
