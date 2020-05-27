import 'package:calculator_app/keys.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  static _MyHomePageState of(BuildContext context) => context.findAncestorStateOfType<_MyHomePageState>();
  @override
  _MyHomePageState createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {

  String output = "0";
  bool secondOp = false;
  String _output = "0";
  double operand1 = 0.0;
  double operand2 = 0.0;
  String operator = "";

  onPressed(String text) {

    if(text == "C") {
      _output = "0";
      operand1 = 0.0;
      operand2 = 0.0;
      operator = "";
    }

    else if(text == "+" || text == "-" || text == "÷" || text == "×" || text == "%") {
      operand1 = double.parse(output);
      secondOp = true;
      operator = text;
      _output = output + operator;
    }

    else if(text == ".") {
      String op = "";
      if(operator!="") {
        op = _output.split(operator)[1];
      }
      else {
        op = _output;
      }
      if(op.contains(".")) {
        print("already contains a decimal");
      }
      else {
        _output += text; 
      }
    }

    else if(text == "±") {
      print(_output);
      if(_output == "0")
        _output = "-";
      else if(operator=="") {
        if(double.parse(output)>=0)
          _output = "-" + _output;
      }
      else if(operator!="") {
        var splits = output.split(operator);
        // if(splits[1]!="" && double.parse(splits[1])>0.0)
          _output = splits[0] + operator + "-" + splits[1];
      }
    }

    else if(text == "=") {
      operand2 = double.parse(output.split(operator)[1]);
      print(operand1);
      print(operand2);
      switch (operator) {
        case "+" : _output = (operand1+operand2).toStringAsFixed(2); 
          break;
        case "-" : _output = (operand1-operand2).toStringAsFixed(2); 
          break;
        case "÷" : _output = (operand1/operand2).toStringAsFixed(2); 
          break;
        case "×" : _output = (operand1*operand2).toStringAsFixed(2); 
          break;
        case "%" :  _output = (operand1*operand2/100).toStringAsFixed(2);
      }

      operand1 = 0.0;
      operand2 = 0.0;
      operator = "";
    }

    else {
      print(text);
      if(_output == "0")
        _output = text;
      else 
        _output += text;
    }

    setState(() {
      output = _output.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.bottomRight,
              colors: [
              Color(0xFFA3815E),
              Color(0xFFAA745B)
            ],)
          ),
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
            child:
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  colors: [
                  Color(0xFFA3815E),
                  Color(0xFFAA745B)
                ],)
              ),
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.symmetric(
                vertical:15.0,
                horizontal:25.0,
              ),
              child: AutoSizeText(output,
                style: TextStyle(
                  fontSize: 70.0,color: Colors.white,
                ),
                maxLines: 1,
              )
            ),
            ),  
            Keys()   //Calling keys.dart to populate the screen with calcuator keys
          ],
        ),
      )
    );
  }
}
