import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'main.dart' as main;

class Keys extends StatelessWidget {

    Widget buildButtons(String text, BuildContext context,bool orange) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      constraints: BoxConstraints(
        minWidth:width/4
      ),
      child: FlatButton(
        shape: RoundedRectangleBorder(side: BorderSide(width:0.2, color: Color(0xFF555555)),
            borderRadius: BorderRadius.circular(0.0)),
        padding: EdgeInsets.all(15.0),
        color: (orange)? Color(0xFFF5923D) : Color(0xFFE0E0E0),
        textColor: (orange)? Colors.white : Colors.black,
        child: Text(text,
          style: TextStyle(
            fontSize: 30.0,
            fontWeight: FontWeight.w300
          ) ,
        ),
        onPressed: () => main.MyHomePage.of(context).onPressed(text),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // home.
    return Container(
      child: 
      Column(
        children:[
          Row(
            children: [
              buildButtons("C",context,false),
              buildButtons("±",context,false),
              buildButtons("%",context,false),
              buildButtons("÷",context,true),
            ]
          ),
          Row(
            children: [
              buildButtons("7",context,false),
              buildButtons("8",context,false),
              buildButtons("9",context,false),
              buildButtons("×",context,true),
            ]
          ),
          Row(
            children: [
              buildButtons("4",context,false),
              buildButtons("5",context,false),
              buildButtons("6",context,false),
              buildButtons("-",context,true),
            ]
          ),
          Row(
            children: [
              buildButtons("1",context,false),
              buildButtons("2",context,false),
              buildButtons("3",context,false),
              buildButtons("+",context,true),
            ]
          ),
          Row(
            children: [
              Container(width:width/2,
              child: buildButtons("0",context,false)),
              Container(width:width/2,
              child: Row(children: <Widget>[
                buildButtons(".",context,false),
                buildButtons("=",context,true)
              ],),)
            ]
          ),
        ],
      ),
    );  
  }
}