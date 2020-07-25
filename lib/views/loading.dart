import 'package:Material_Calculator/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:Material_Calculator/views/calculator.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {


  void initialPlayer() async {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Calculator()));
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initialPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(      
      backgroundColor: Colors.blueGrey[900],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: 200),
          SpinKitFadingCube(
            color: Colors.white,
            size: 80,
          ),
          Padding(              
            padding: EdgeInsets.only(top: 400),
            child: Text(
              'Developed by Xyber',
              style: TextStyle(
                color: Colors.grey[700],
                letterSpacing: 2,
                fontSize: 20
              ),
            ),
          )
        ],
      )
    );
  }
}