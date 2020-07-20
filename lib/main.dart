import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Calculator(),
  ));
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // height for the buttons of the calculator
  double buttonHeight = 70;
  double buttonWidth = 70;

  bool themeState = false;
  bool longOutput = false;

  //Logic of code
  String output = "";
  String operator = "";
  String smallOutput = "";

  String _output = ""; // newNumber
  String _operator = "";
  // String _smallOutput = ""; // result

  double operand1 = 0; //If 0 creates a problem, replace w/ null
  double operand2 = 0.0;
  String pendingOperation = "";

  int numCheck = 0;

  //UI of the code

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(body: Builder(builder: (context) {
      return Container(
        child: Column(
          children: <Widget>[
            Container(
              child: Expanded(
                child: Column(
                  children: <Widget>[
                    /*1*/
                    Expanded(
                      child: Container(
                        color: themeState == true
                            ? Colors.blueGrey[900]
                            : Colors.teal[50],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(bottom: 10, left: 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  SizedBox(
                                    height: 120,
                                  ),
                                  Text(
                                    operator,
                                    style: TextStyle(
                                        fontFamily: 'Varela',
                                        fontSize: 50,
                                        color: themeState == true
                                            ? Colors.tealAccent[700]
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  themeButton(),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    smallOutput,
                                    style: TextStyle(
                                        fontFamily: 'Varela',
                                        fontSize: 45,
                                        color: themeState == true
                                            ? Colors.blueGrey[400]
                                            : Colors.grey[700]),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    output,
                                    style: TextStyle(
                                        fontFamily: 'Varela',
                                        fontSize: 60,
                                        color: themeState == true
                                            ? Colors.tealAccent[700]
                                            : Colors.black),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    /*2*/
                    Expanded(
                      flex: 2,
                      child: Container(
                        color: themeState == true
                            ? Colors.blueGrey[800]
                            : Colors.white10,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            /*1*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                operatorButton("C", "C", 40),
                                numButton("7"),
                                numButton("4"),
                                numButton("1"),
                                numButton("0"),
                              ],
                            ),
                            /*2*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                operatorButton("+/-", "+/-", 30),
                                numButton("8"),
                                numButton("5"),
                                numButton("2"),
                                numButton("."),
                              ],
                            ),
                            /*3*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                operatorButton("%", "%", 40),
                                numButton("9"),
                                numButton("6"),
                                numButton("3"),
                                delButton()
                              ],
                            ),
                            /*4*/
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                operatorButton("÷", "÷", 40),
                                operatorButton("X", "x", 35),
                                operatorButton("-", "-", 40),
                                operatorButton("+", "+", 40),
                                equalButton()
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }));
  }

  Widget delButton() {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      child: RawMaterialButton(
        onPressed: () {
          buttonPressed("del");
        },
        child: Icon(
          Icons.backspace,
          color: _output.length == 0 ? Colors.grey : Colors.red[400],
        ),
        shape: CircleBorder(),
        elevation: 0,
        fillColor: themeState ? Colors.blueGrey[800] : Colors.white10,
        splashColor: Colors.tealAccent[400],
        highlightElevation: 0,
        highlightColor: Colors.transparent,
      ),
    );
  }

  Widget equalButton() {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: RawMaterialButton(
        onPressed: () {
          buttonPressed("=");
        },
        child: Text(
          '=',
          style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 40,
              color: themeState == true ? Colors.blueGrey[900] : Colors.white),
        ),
        shape: CircleBorder(),
        elevation: 0,
        fillColor: Colors.tealAccent[400],
        splashColor: Colors.teal[50],
        highlightColor: Colors.transparent,
      ),
    );
  }

  Widget operatorButton(String onButton, String pressButton, double size) {
    return Container(
      width: buttonWidth,
      height: buttonHeight,
      child: RawMaterialButton(
        onPressed: () {
          buttonPressed(pressButton);
        },
        child: Text(
          onButton,
          style: TextStyle(
              fontFamily: 'Varela',
              fontSize: size,
              color:
                  themeState == true ? Colors.tealAccent[400] : Colors.black),
        ),
        shape: CircleBorder(),
        elevation: 0,
        fillColor: themeState == true ? Colors.blueGrey[900] : Colors.teal[50],
        splashColor: Colors.tealAccent[400],
        highlightColor: Colors.transparent,
      ),
    );
  }

  Widget numButton(String onButton) {
    return Container(
      height: buttonHeight,
      width: buttonWidth,
      child: RawMaterialButton(
        onPressed: () {
          buttonPressed(onButton);
        },
        child: Text(
          onButton,
          style: TextStyle(
              fontFamily: 'Varela',
              fontSize: 40,
              color: themeState == true ? Colors.blueGrey[300] : Colors.black),
        ),
        shape: CircleBorder(),
        elevation: 0,
        fillColor: themeState ? Colors.blueGrey[800] : Colors.white10,
        splashColor: Colors.tealAccent[400],
        highlightElevation: 0,
        highlightColor: Colors.transparent,
      ),
    );
  }

  Widget themeButton() {
    return FlatButton.icon(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      onPressed: () {
        setState(() {
          if (themeState == false) {
            themeState = true;
          } else {
            themeState = false;
          }
        });
      },
      splashColor: Colors.tealAccent,
      icon: Icon(
        themeState ? Icons.brightness_3 : Icons.brightness_7,
        color: themeState ? Colors.grey : Colors.amber,
      ),
      color: themeState == true ? Colors.blueGrey[900] : Colors.teal[50],
      label: themeState == true
          ? Text(
              'Turn on Lights',
              style: TextStyle(color: Colors.blueGrey[400]),
            )
          : Text(
              'Turn off Lights',
              style: TextStyle(color: Colors.blueGrey[900]),
            ),
    );
  }

  // Functions for logic of the code
  performOperation(String value, String operation) {
    if (operand1 == 0) {
      operand1 = double.parse(value);
    } else {
      operand2 = double.parse(value);

      if (pendingOperation == "=") {
        pendingOperation = operation;
      }

      if (pendingOperation == "=") {
        operand1 = operand2;
        // _output = operand1.toString();
      } else if (pendingOperation == "÷") {
        if (operand2 == 0.0) {
          operand1 = double.nan;
        } else {
          operand1 = operand1 / operand2;
          // _output = operand1.toString();
        }
      } else if (pendingOperation == "x") {
        operand1 = operand1 * operand2;
        // _output = operand1.toString();
      } else if (pendingOperation == "-") {
        operand1 = operand1 - operand2;
        // _output = operand1.toString();
      } else if (pendingOperation == "+") {
        operand1 = operand1 + operand2;
        // _output = operand1.toString();
      } else if (pendingOperation == "%") {
        operand1 = (operand1 / 100) * operand2;
      }
    }

    _output = "";

    setState(() {
      String num = operand1.toString();

      //this is the logic for huge numbers as the output
      if (num.length > 12) {
        smallOutput = operand1.toStringAsFixed(10);
      } else {
        smallOutput = operand1.toString();
      }

      // print(smallOutput.substring(0, smallOutput.length - 2));
      // Logic for erasing the last '.0' in the small output for integers
      if (smallOutput[smallOutput.length - 1] == '0' &&
          smallOutput[smallOutput.length - 2] == '.') {
        smallOutput = smallOutput.substring(0, smallOutput.length - 2);
      }

      output = "";
    });
  }

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      // _smallOutput = "";
      setState(() {
        smallOutput = ""; // Last change
      });

      operand1 = null;
      operand2 = 0.0;
      _output = "";
      _operator = "";
      setState(() {
        output = "";
      });

      setState(() {
        operator = "";
      });
    }

    if (buttonText == "0" ||
        buttonText == "1" ||
        buttonText == "2" ||
        buttonText == "3" ||
        buttonText == "4" ||
        buttonText == "5" ||
        buttonText == "6" ||
        buttonText == "7" ||
        buttonText == "8" ||
        buttonText == "9" ||
        buttonText == ".") {
      //small logic for not allowing to enter decimal, if one is already present in the output field
      bool flag = true;
      if (buttonText == ".") {
        for (int i = 0; i < _output.length; i++) {
          if (_output[i] == ".") {
            flag = false;
            break;
          }
        }
        if (flag == false) {
          buttonText = null;
        }
      } // logic for the decimal ends here

      //logic for not appending bigger values to _output
      if (_output.length > 7) {
        buttonText = null;
        longOutput = true;
      } else if (_output.length < 8) {
        longOutput = false;
      }
      // logic ends here

      // print(_output.length);
      print(longOutput);

      _output = _output + buttonText;
      setState(() {
        output = _output;
      });
    }

    if (buttonText == "=" ||
        buttonText == "x" ||
        buttonText == "÷" ||
        buttonText == "-" ||
        buttonText == "+" ||
        buttonText == "%") {
      String op = buttonText.toString();
      String value = output.toString();
      if (value.isNotEmpty) {
        performOperation(value, op);
      }
      pendingOperation = op;
      _operator = pendingOperation;
      setState(() {
        if (buttonText != "=") {
          operator = _operator;
        } else {
          operator = "";
        }
      });
    }

    if (buttonText == "+/-") {
      double val = double.parse(_output);

      if (val < 0) {
        val -= 2 * val;
      } else if (val > 0) {
        val -= 2 * val;
      } else {
        print('Value is already 0');
      }

      _output = val.toString();
      _output = _output.substring(0, _output.length - 1);
      _output = _output.substring(0, _output.length - 1);
      setState(() {
        output = _output;
      });
    }

    if (buttonText == "del") {
      // print(_output.substring(0, _output.length - 1));
      _output = _output.substring(0, _output.length - 1);
      setState(() {
        output = _output;
      });
    }
  }
}
