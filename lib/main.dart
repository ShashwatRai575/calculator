import 'package:flutter/material.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result = '0';
  double num1 = 0;
  double num2 = 0;
  String operand = '';

  buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'C') {
        result = '0';
        num1 = 0;
        num2 = 0;
        operand = '';
      } else if (buttonText == '+/-') {
        result = (-double.parse(result)).toString();
      } else if (buttonText == '%') {
        result = (double.parse(result) / 100).toString();
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '*' ||
          buttonText == '/') {
        num1 = double.parse(result);
        operand = buttonText;
        result = '0';
      } else if (buttonText == '.') {
        if (!result.contains('.')) {
          result = result + '.';
        }
      } else if (buttonText == '=') {
        num2 = double.parse(result);
        if (operand == '+') {
          result = (num1 + num2).toString();
        }
        if (operand == '-') {
          result = (num1 - num2).toString();
        }
        if (operand == '*') {
          result = (num1 * num2).toString();
        }
        if (operand == '/') {
          result = (num1 / num2).toString();
        }
        num1 = 0;
        num2 = 0;
        operand = '';
      } else {
        if (result == '0') {
          result = buttonText;
        } else {
          result = result + buttonText;
        }
      }
    });
  }

  Widget buildButton(String buttonText) {
    return Expanded(
      child: ElevatedButton(
        child: Text(
          buttonText,
          style: const TextStyle(fontSize: 24, color: Colors.white),
        ),
        onPressed: () => buttonPressed(buttonText),
  style: ElevatedButton.styleFrom(
    padding: const EdgeInsets.all(20),
    shape: const CircleBorder(),
    primary: Colors.grey[850],
  ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              padding: const EdgeInsets.all(12.0),
              alignment: Alignment.bottomRight,
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Row(
              children: <Widget>[
                buildButton('C'),
                buildButton('+/-'),
                buildButton('%'),
                buildButton('/'),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              children: <Widget>[
                buildButton('7'),
                buildButton('8'),
                buildButton('9'),
                buildButton('*'),
              ],
            ),
            const SizedBox(height: 10,),

            Row(
              children: <Widget>[
                buildButton('4'),
                buildButton('5'),
                buildButton('6'),
                buildButton('-'),
              ],
            ),
      const SizedBox(height: 10,),
            Row(
              children: <Widget>[
                buildButton('1'),
                buildButton('2'),
                buildButton('3'),
                buildButton('+'),
              ],
            ),
const SizedBox(height: 10,),
            Row(
              children: <Widget>[
                buildButton('00'),
                buildButton('0'),
                buildButton('.'),
                buildButton('='),
              ],
            ),
          ]
        )
      )
    );
  }
}        
