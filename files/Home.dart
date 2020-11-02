import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data={};
  @override
  Widget build(BuildContext context) {
    data= data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    String backgroundImage=data['isDayTime']? 'sun.jpg':'night.jpg';

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[800],
        centerTitle: true,
        title: Text("World Time",
          style: TextStyle(
              fontSize: 20.0 ,
              color: Colors.white
          ),
        ),
      ),
      body: SafeArea(
        child: Container(

          decoration: BoxDecoration(

            image: DecorationImage(
              image: AssetImage('assetsss/$backgroundImage'),
              fit: BoxFit.cover,
            ),

          ),

            child: Padding(
              padding:  EdgeInsets.fromLTRB(0,120, 0, 0),
              child: Column(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: AssetImage('assetsss/${data['flag']}'),
                    ),
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height:15.0,
                    ),
                    Text(
                      data['time'],
                      style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.white,
                      ),
                    ),


                  SizedBox(
                    height: 350.0,
                  ),

                   Align(
                      alignment: Alignment.bottomCenter,
                      child:ButtonTheme(
                        minWidth:390.0,
                          height: 60.0,
                          child:RaisedButton.icon(
                      color: Colors.blueGrey[800],
                      highlightElevation: 20.0,
                      icon: Icon(Icons.location_searching,
                        color: Colors.white,

                      ),
                      label: Text(
                        "Choose Location",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,

                        ),
                      ),
                      onPressed: () async {
                       dynamic results=await  Navigator.pushNamed(context,'/location');
                       setState(() {
                         data={
                           'time':results['time'],
                           'location':results['location'],
                           'flag':results['flag'],
                           'isDayTime':results['isDayTime'],

                         };
                       });
                      },
                    )
                      ),
                   ),

                ],
              ),

          ),
        ),
      ),
    );

  }
}