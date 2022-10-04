import 'package:flutter/material.dart';
import 'mybuttons.dart';
import 'profile.dart';
import 'package:math_expressions/math_expressions.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var input = '';
  var result = '';
  
  // Array of button
  final List<String> buttons = [
    'C',
    '+/-',
    '=',
    'DEL',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    'x',
    '1',
    '2',
    '3',
    '-',
    '0',
    '00',
    '.',
    '+',
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.cyan),
      home: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget> [
              Text(
                'Calculator',
                style: TextStyle(color: Colors.white),
                ),
                TextButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AboutMe(),));
            }, child: Text('About me', style: TextStyle(color: Colors.white))
                )]
            )),
          
        body: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(20),
                      alignment: Alignment.centerRight,
                      child: Text(
                        input,
                        style: TextStyle(fontSize: 20),
                        maxLines: 1,
                    ),
                    ),
                    Container(
                      padding: EdgeInsets.all(15),
                      alignment: Alignment.centerRight,
                      child: Text(
                        result,
                        style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        maxLines: 1,
                      ),
                    ),
                  ],
                  ),
                ),
              ),
            Expanded(
              flex: 3,
              child: Container(
                child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    childAspectRatio: 1.1,
                    ),
                  itemBuilder: (BuildContext context, int index) {
                    if(index == 0) { //clear button
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            input = '';
                            result = '0';
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan,
                        textColor: Colors.white,
                      );
                    }
                    else if(index == 1) {// button +/-
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            if(input.contains('+') == true || input.substring(1).contains('-') == true || input.contains('x') == true || input.contains('/') == true) {
                              input = input;
                            }
                            else if(input[0] == '-') {
                              input = input.substring(1);
                            }
                            else {
                              input = '-' + input;
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan,
                        textColor: Colors.white,
                      );
                    }
                    else if(index == 3) { //delete button
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            input = input.substring(0, input.length-1);
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan,
                        textColor: Colors.white,
                      );
                    }
                    else if(index == 2) { // button =
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            output();
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan,
                        textColor: Colors.white,
                      );
                    }
                    else if(index == 16 || index == 17) { //button 0 and 00
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            if(input != '') {
                              input += buttons[index];
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan[50],
                        textColor: Colors.black,
                      );
                    }
                    else if(index == 18) {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            if(input == '') {
                              input = '0' + buttons[index];
                            }
                            else if(input.contains('.') == false) {
                              input += buttons[index];
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: Colors.cyan[50],
                        textColor: Colors.black,
                      );
                    }
                    else {
                      return MyButton(
                        buttontapped: () {
                          setState(() {
                            if(input == '' && !operator(buttons[index])) {
                              input += buttons[index];
                            }
                            else if(input != '') {
                              if(operator(buttons[index])) {
                                if(input.contains('+') || input.contains('-') || input.contains('x') || input.contains('/')) {
                                  input = input;
                                }
                                else {
                                  input += buttons[index];
                                }
                              }
                              else{
                               input += buttons[index];
                              }
                            }
                          });
                        },
                        buttonText: buttons[index],
                        color: operator(buttons[index]) ? Colors.cyan : Colors.cyan[50],
                        textColor: operator(buttons[index]) ? Colors.white : Colors.black,
                      );
                    }
                  }
                  ),
              ),
              ),
          ],
        ), 
        ),
        );  
  }
  bool operator(String s) {
    if(s == '+' || s == '-' || s == 'x' || s == '/') {
      return true;
    }
    else {
      return false;
    }
  }
  void output() { //calculate
    String finalinput = input;
    finalinput = input.replaceAll('x', '*');
    Parser parser = Parser();
    Expression exp = parser.parse(finalinput);
    ContextModel contextModel = ContextModel();
    double e = exp.evaluate(EvaluationType.REAL, contextModel);
    result = e.toString();
  }
}


