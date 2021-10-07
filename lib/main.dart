import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:taskacm/path/form.dart';

void main() {
  runApp(MaterialApp(home: task()));
}

class task extends StatefulWidget {
  @override
  _taskState createState() => _taskState();
}

class _taskState extends State<task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.white70,
      appBar: AppBar(
        backgroundColor: Color(0x73FFFFFF),
        elevation: 0.0,
        title: Center(
            child: Text('ACCOUNT DETAILS',
                style: TextStyle(
                  fontFamily: 'MS',
                  fontSize: 25,
                  letterSpacing: 2,

                  color: Colors.black,
                ))),
      ),
      body: Container(
          child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(
              width: double.infinity,
              height: double.infinity,
              child: Image.asset(
                'pics/av.png',
                fit: BoxFit.fitHeight,
              )),
          SizedBox(
            height: 100,
          ),
          Container(
              height: 530,
              width: 500,
              alignment: Alignment.center,
              color: Color(0x73e6e696),
              padding: EdgeInsets.only(bottom:00),
              margin: EdgeInsets.all(25),
              child: form()),
        ],
      )),
    );
  }
}
