import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';
class WorldTime{
  String time,location,url;
  bool isDayTime;
  String flag;
  WorldTime({this.location,this.url,this.flag});
  Future<void> getTime() async{
    Response response=await get('http://worldtimeapi.org/api/timezone/$url');
    Map dataa=jsonDecode(response.body);
    String d=dataa['datetime'];
    String offset=dataa['utc_offset'].substring(1,3);
    DateTime curr=DateTime.parse(d);
    curr=curr.add(Duration(hours:int.parse(offset)));
    isDayTime=curr.hour> 5 && curr.hour< 19 ? true : false;
    time=DateFormat.jm().format(curr);


  }
}