import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class calculator extends StatefulWidget {
  const calculator({Key key}) : super(key: key);

  @override
  _calculatorState createState() => _calculatorState();
}

class _calculatorState extends State<calculator> {
  var Output = "";

  Widget btnNum(var numm) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          Output = Output + numm;
        });
      },
      child: Container(
          height: 100,
          width: 50,
          padding: EdgeInsets.only(top: 30, left: 15),
          child: Text(numm,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ))),
    );
  }

  clear() {
    setState(() {
      Output = "";
    });
  }

  clr() {
    setState(() {
      Output = Output.substring(0, Output.length - 1);
    });
  }

  result() {
    Parser p = Parser();
    Expression exp = p.parse(Output);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      Output = eval.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Text(
                  "CALCULATOR",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 60,
                  width: 360,
                  color: Colors.grey,
                  child: Text(
                    Output,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      height: 80,
                      width: 120,
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: clr,
                          child: Text("AC",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              )))),
                  Container(
                      height: 80,
                      width: 120,
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: clear,
                          child: Text("clear",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              )))),
                  Container(
                      height: 80,
                      width: 120,
                      padding: EdgeInsets.only(top: 30),
                      child: ElevatedButton(
                          onPressed: result,
                          child: Text("=",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: Colors.white,
                              )))),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btnNum("7"),
                  btnNum("8"),
                  btnNum("9"),
                  btnNum("+"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btnNum("4"),
                  btnNum("5"),
                  btnNum("6"),
                  btnNum("-"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btnNum("1"),
                  btnNum("2"),
                  btnNum("3"),
                  btnNum("*"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  btnNum("0"),
                  btnNum("00"),
                  btnNum("."),
                  btnNum("/"),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
