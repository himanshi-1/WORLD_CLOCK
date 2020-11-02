import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:time_app/services/WorldTime.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


    void setTime() async{
      WorldTime instance=WorldTime (location:'India',url:'Asia/Kolkata',flag: 'indian.jpg');
      await instance.getTime();
      Navigator.pushReplacementNamed(context,'/home',arguments:{
        'location':instance.location,
        'time':instance.time,
        'flag':instance.flag,
        'isDayTime':instance.isDayTime,
      }
      );

    }
    void initState(){
      super.initState();
      setTime();
    }
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Column(
        children: <Widget>[
          SpinKitFadingCircle(
            color:Colors.black,

            size:50.0,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text("You're Offline..",
          style: TextStyle(
            color: Colors.blueAccent[800],
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
          )
        ],
      ),
      ),
    );
  }
}
