import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator',
      home: MyCalculator(),
    );
  }
}

class MyCalculator extends StatefulWidget {
  @override
  _MyCalculatorState createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  double result = 0.0;
  String strResult = '';
  String operator = '';
  bool isFirstValue = true;
  double firstNumber, secondNumber;
  void onDigitPress(String text) {
    if(text == '+'){
      operator = '+';
      if(firstNumber == null){
        firstNumber = double.tryParse(strResult);
      }
      setState(() {
        strResult = '';
      });
    }
    else if(text == '-'){
      operator = '-';
      if(firstNumber == null){
        firstNumber = double.tryParse(strResult);
      }
      setState(() {
        strResult = '';
      });
    }
    else if(text == 'x'){
      operator = 'x';
      if(firstNumber == null){
        firstNumber = double.tryParse(strResult);
      }
      setState(() {
        strResult = '';
      });
    }
    else if(text == '/'){
      operator = '/';
      if(firstNumber == null){
        firstNumber = double.tryParse(strResult);
      }
      setState(() {
        strResult = '';
      });
    }
    else if(text == '='){
      switch (operator) {
        case '+':
          secondNumber = double.tryParse(strResult);
          setState(() {
            result = firstNumber + secondNumber;
          });
          strResult = '';
          firstNumber  = null;
          secondNumber  = null;
          break;
        case '-':
        secondNumber = double.tryParse(strResult);
        setState(() {
          result = firstNumber - secondNumber;
        });
          strResult = '';
        firstNumber  = null;
        secondNumber  = null;
          break;
        case 'x':
          secondNumber = double.tryParse(strResult);
          setState(() {
            result = firstNumber * secondNumber;
          });
          strResult = '';
          firstNumber  = null;
          secondNumber  = null;
          break;
        case '/':
          secondNumber = double.tryParse(strResult);
          setState(() {
            result = firstNumber / secondNumber;
          });
          strResult = '';
          firstNumber  = null;
          secondNumber  = null;
          break;
      }
    }
    else if(text == '<-'){
      if(strResult == null) {
        strResult = '';
      }
      else {
        setState(() {
          strResult = strResult.substring(0, strResult.length -1 );
          result = double.tryParse(strResult);
        });
      }
    }
    else{
      setState(() {
        strResult += text;
      });
      if(strResult == ''){
        result = 0.0;
      }
      else {
        setState(() {
          result = double.tryParse(strResult);
        });
      }
    }
  }
  void setClear() {
    setState(() {
      strResult = '';
      result = 0.0;
      firstNumber = null;
      secondNumber = null;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  '$result',
                  style: TextStyle(fontSize: 60),
                ),
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    flex: 2,
                    child: FlatButton(
                      onPressed: (){
                        setClear();
                      },
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        side: BorderSide(
                            color: Colors.red,
                            style: BorderStyle.solid
                        )
                    ),
                      child: Text(
                        'C',
                        style: TextStyle(fontSize: 40, color: Colors.white),
                      ),
                  ),
                  ),
                  buttonComp('<-', Colors.blueGrey),
                  buttonComp('/', Colors.blueGrey)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buttonComp('7', Colors.black54),
                  buttonComp('8', Colors.black54),
                  buttonComp('9', Colors.black54),
                  buttonComp('x', Colors.blueGrey)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buttonComp('4', Colors.black54),
                  buttonComp('5', Colors.black54),
                  buttonComp('6', Colors.black54),
                  buttonComp('+', Colors.blueGrey)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buttonComp('1', Colors.black54),
                  buttonComp('2', Colors.black54),
                  buttonComp('3', Colors.black54),
                  buttonComp('-', Colors.blueGrey)
                ],
              ),
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  buttonComp('.', Colors.black54),
                  buttonComp('0', Colors.black54),
                  buttonComp('00', Colors.black54),
                  buttonComp('=', Colors.blueGrey)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded buttonComp(String text, Color color) {
    return Expanded(
                  child: FlatButton(
                    onPressed: () {
                      onDigitPress(text);
                    },
                    color: color,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      side: BorderSide(
                        color: Colors.black26,
                        style: BorderStyle.solid
                      )
                    ),
                    child: Text(
                      text,
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                  ),
                );
  }
}


