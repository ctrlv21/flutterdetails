import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
class form extends StatefulWidget {

  @override
  formState createState() => formState();
}

class formState extends State<form> {
  String? name;
  String? number;
  String? dob;
  String? age;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Widget _buildname(){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right:10.0,bottom: 8.0),
      child: TextFormField(
       decoration: InputDecoration(labelText:'Name',
       labelStyle: TextStyle(
         fontFamily: 'MS',
         fontSize: 20,
         letterSpacing: 2,
         fontWeight: FontWeight.bold,
         color: Colors.black,

       ),),
       validator: (String? value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
      },
        onSaved:(String? value){name = value;},
      ),
    );
  }
  Widget _buildnumber(){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right:10.0,bottom: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText:'Number',
          labelStyle: TextStyle(
          fontFamily: 'MS',
          fontSize: 20,
          letterSpacing: 2,
          fontWeight: FontWeight.bold,
          color: Colors.black,),),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';

          }

        },
        onSaved:(String? value){number = value;},
      ),
    );
  }
  Widget _buildage(){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right:10.0,bottom: 8.0),
      child: TextFormField(
        keyboardType: TextInputType.number,
        decoration: InputDecoration(labelText:'Age:',
          labelStyle: TextStyle(
            fontFamily: 'MS',
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Colors.black,),),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';

          }

        },
        onSaved:(String? value){age = value;},
      ),
    );
  }
  Widget _builddob(){
    return Padding(
      padding: const EdgeInsets.only(left:10.0,right:10.0,bottom: 8.0),
      child: TextFormField(
        decoration: InputDecoration(labelText:'Date of Birth dd/mm/yyyy',
          labelStyle: TextStyle(
            fontFamily: 'MS',
            fontSize: 20,
            letterSpacing: 2,
            fontWeight: FontWeight.bold,
            color: Colors.black,),),
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return 'Please enter some text';
          }
          if (!RegExp(
              r'^(?:(?:31(/|-|.)(?:0?[13578]|1[02]))\1|(?:(?:29|30)(/|-|.)(?:0?[13-9]|1[0-2])\2))(?:(?:1[6-9]|[2-9]\d)?\d{2})$|^(?:29(/|-|.)0?2\3(?:(?:(?:1[6-9]|[2-9]\d)?(?:0[48]|[2468][048]|[13579][26])|(?:(?:16|[2468][048]|[3579][26])00))))$|^(?:0?[1-9]|1\d|2[0-8])(/|-|.)(?:(?:0?[1-9])|(?:1[0-2]))\4(?:(?:1[6-9]|[2-9]\d)?\d{2})$')
              .hasMatch(value)) {
            return 'Please enter a Valid Date of Birth';
          }
        },
        onSaved:(String? value){dob = value;},
      ),
    );
  }
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0x73e6e696),
      body: Container(
        padding: EdgeInsets.only(bottom:30),
        child: Form(
         key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:<Widget> [
              _buildname(),
              _buildnumber(),
              _builddob(),
              _buildage(),
              Container(
                //padding: EdgeInsets.only(bottom: 150),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xFF516132),
                    padding: EdgeInsets.symmetric(horizontal: 7, vertical: 7),

                  ),
                  onPressed: (){
                  if (!_formKey.currentState!.validate()){
                    return;
                  }
                  _formKey.currentState!.save();
                  print(name);
                  print(number);
                  print(dob);
                  print(age);
                  Navigator.push(
                  context,
                   new MaterialPageRoute(builder: (context) => new SecondRoute(value: name,num: number,db: dob ,age : age)),
                  );



                },
                    child: Text('SUBMIT',
                    style: TextStyle(
                      fontFamily: 'MS',
                      fontSize: 15,
                      letterSpacing: 2,

                      color: Colors.black,),
                ),
              ))
            ],
            ),
          ) ,

        ),
      );}}
class SecondRoute extends StatefulWidget {
  final String? value;
  final String? num;
  final String? db;
  final String? age;
  const SecondRoute({Key? key,this.value,this.num,this.db,this.age}) : super(key: key);

  @override
  _SecondRouteState createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        extendBodyBehindAppBar: true,
        backgroundColor: Color(0xffc7dc9f),
        appBar: AppBar(
          backgroundColor: Color(0x66FFFFFF),
          elevation: 0.0,
          title: Container(
              padding: EdgeInsets.only(left: 30),
              child: Text('IDENTITY CARD',
                  style: TextStyle(
                    fontFamily: 'MS',
                    fontSize: 25,
                    letterSpacing: 1,

                    color: Colors.black,
                  ))),
        ),
        body: Container(
          decoration: BoxDecoration(
              color: Color(0xcc6ea456
              ),
            border: Border.all(
                color: Color(0xccc8db9e)
            ),
            borderRadius: BorderRadius.all(Radius.circular(20))
          ),
          margin: EdgeInsets.only(top:295, left: 40,right: 40),
          alignment: Alignment.center,
          width: 450,
          height: 250,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(left: 73),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('pics/ca.jpg'),
                    radius: 50.0,
                  ),
                ),
                SizedBox(height: 20,),
                new Text("Name: ${widget.value}",
                style: TextStyle(
                  fontFamily: 'MS',
                  fontSize: 20,
                  letterSpacing: 1,

                  color: Colors.black,
                ),),
                new Text("Number:${widget.num}",
                  style: TextStyle(
                    fontFamily: 'MS',
                    fontSize: 20,
                    letterSpacing: 1,

                    color: Colors.black,
                  ),),
                new Text("Age:${widget.age}",
                  style: TextStyle(
                    fontFamily: 'MS',
                    fontSize: 20,
                    letterSpacing: 1,

                    color: Colors.black,
                  ),),
                new Text("Date Of Birth: ${widget.db}",
                  style: TextStyle(
                    fontFamily: 'MS',
                    fontSize: 20,
                    letterSpacing: 1,

                    color: Colors.black,
                  ),)
              ],
            ),
          ) ,    )

    );
  }
}
