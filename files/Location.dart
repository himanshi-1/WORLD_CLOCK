import 'package:flutter/material.dart';
import 'package:time_app/services/WorldTime.dart';
class Location extends StatefulWidget {
  @override
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<WorldTime> details=[

  WorldTime(location:'Afghanistan',url:'Asia/Kabul',flag:'afghanistan.jpg'),
    WorldTime(location:'America',url:'America/New_York',flag:'america.jpg'),
    WorldTime(location:'Africa',url:'Africa/Abidjan',flag:'africa.png'),
    WorldTime(location:'Antarctica',url:'Antarctica/Casey',flag:'antarctica.jpg'),
    WorldTime(location:'Bangkok',url:'Asia/Bangkok',flag:'bangkok.jpg'),
    WorldTime(location:'China',url:'Asia/Hong_Kong',flag:'china.jpg'),
    WorldTime(location:'Dubai',url:'Asia/Dubai',flag:'dubai.jpg'),
    WorldTime(location:'Europe',url:'Europe/Berlin',flag:'europe.jpg'),
    WorldTime(location:'India',url:'Asia/Kolkata',flag:'indian.jpg'),
    WorldTime(location:'Pakistan',url:'Asia/Karachi',flag:'pakistan.png'),
    WorldTime(location:'Singapore',url:'Asia/Singapore',flag:'singapore.jpg'),
    WorldTime(location:'Srilanka',url:'Asia/Colombo',flag:'srilanka.jpg'),

  ];
  void updateTime(index)async{
    WorldTime instance=details[index];
    await instance.getTime();
    Navigator.pop(context,{
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDayTime':instance.isDayTime,


    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        title: Text("Choose Location",
          style: TextStyle(
              fontSize: 20.0 ,
              color: Colors.white
          ),
        ),
        ),
      body: ListView.builder(
          itemCount: details.length,

          itemBuilder: (context,index){
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 1.0,horizontal: 2.0),
              child:Card(

                child: ListTile(
                  onTap: (){
                    updateTime(index);
                  },
                  title: Text(details[index].location),
                    leading:CircleAvatar(
                      backgroundImage: AssetImage('assetsss/${details[index].flag}'),
                    ),

                ),
              ),
            );
          }
      ),


    );
  }
}
