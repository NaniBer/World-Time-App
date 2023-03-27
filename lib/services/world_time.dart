import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime{
  String location=''; //Location name for the ui
  String time=''; //The time in that location
  String flag=''; //url to an asset flag icon
  String url='';// location url for api endpoint
  bool isDaytime=true;

  WorldTime({required this.location, required this.flag, required this.url});


  Future<void> getTime() async {
    try {
      Response response = await get(
          Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      //print(data);

      //Get properties from Data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].toString().substring(1, 3);
      // print(datetime);
      // print(offset);

      //Create a dateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDaytime= now.hour>6 && now.hour<20 ? true: false;
      time =  DateFormat.jm().format(now);

    }
    catch(e) {
      print('Caught an error: $e');
      time='Could not get time Data';
    }



  }



}

