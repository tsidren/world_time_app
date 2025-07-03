import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location;
  String? time;
  String flag;
  String urlparam; // https://timeapi.io/api/time/current/zone?timeZone=Asia%2FKolkata
  bool? isDaytime;

  WorldTime({required this.location, required this.flag, required this.urlparam});

  Future<void> getTime() async {
    var url = Uri.parse('https://timeapi.io/api/time/current/zone?timeZone=$urlparam');

    try {
      final response = await get(url,
          headers: {
            'Accept': 'application/json',
          });

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        // print(data);
        String dateTime = data['dateTime'];
        DateTime now = DateTime.parse(dateTime);
        isDaytime = now.hour > 6 && now.hour < 19 ? true : false;
        time = DateFormat.jm().format(now);
      } else {
        print('Request failed with status: ${response.statusCode}');
      }
    } catch (e) {
      print('Error occurred: $e');
      time = 'could not get time data';
    }
  }
}