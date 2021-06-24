import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class TheCalculator extends StatefulWidget {
  @override
  _TheCalculatorState createState() => _TheCalculatorState();
}

class _TheCalculatorState extends State<TheCalculator> {

  String equation ="0";
  String result = "0";
  String expression = '';
  double equationFontSize = 38.0;
  double resultFontSize = 48.0;


  buttonPressed(String texts) {
   setState(() {
     if (texts == "C"){
       double equationFontSize = 38.0;
       double resultFontSize = 48.0;
       String equation ="0";
       String result = "0";
       String expression = '';
       

     }else if (texts == "⇽"){
       double equationFontSize = 48.0;
       double resultFontSize = 38.0;
       equation = equation.substring(0,equation.length-1 );
       if(equation == ''){
         equation ='0';
         result = '0';
       }

     }else if(texts == "="){
       double equationFontSize = 38.0;
       double resultFontSize = 48.0;
       expression= equation;
       expression = expression.replaceAll('×', '*');
       expression = expression.replaceAll('÷', '/');
       try{
         Parser p = Parser();
         Expression exp = p.parse(expression);

         ContextModel contextModel = ContextModel();
         result = '${exp.evaluate(EvaluationType.REAL, contextModel)}';
       }catch(e){
         result = "Error";
       }

     }else{
       double equationFontSize = 48.0;
       double resultFontSize = 38.0;
       if(equation== '0'){
         equation = texts;
       }else{
         equation = equation + texts;
       }
     }

   });
  }

  Widget boxes(String texts, double height, Color color) => Container(
        height: MediaQuery.of(context).size.height * 0.1 * height,
        child: MaterialButton(
          color: color,
          padding: EdgeInsets.all(16),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
              side: BorderSide(
                  color: Colors.white, width: 1, style: BorderStyle.solid)),
          onPressed: () => buttonPressed(texts),
          child: Text(
            texts,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.normal,
              color: Colors.white,
            ),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 8.0, top: 8.0),
            child: Text(
              equation,
              style: TextStyle(fontSize: equationFontSize),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 8.0, top: 8.0),
            child: Text(
              result,
              style: TextStyle(fontSize: resultFontSize),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.75,
                child: Column(
                  children: [
                    Row(children: [
                      boxes('C', 1, Colors.redAccent),
                      boxes('+', 1, Colors.blue),
                      boxes('⇽', 1, Colors.green),
                    ]),
                    Row(children: [
                      boxes('7', 1, Colors.grey),
                      boxes('8', 1, Colors.grey),
                      boxes('9', 1, Colors.grey),
                    ]),
                    Row(children: [
                      boxes('4', 1, Colors.grey),
                      boxes('5', 1, Colors.grey),
                      boxes('6', 1, Colors.grey),
                    ]),
                    Row(children: [
                      boxes('3', 1, Colors.grey),
                      boxes('2', 1, Colors.grey),
                      boxes('1', 1, Colors.grey),
                    ]),
                    Row(children: [
                      boxes('.', 1, Colors.grey),
                      boxes('0', 1, Colors.grey),
                      boxes('00', 1, Colors.grey),
                    ]),
                  ],
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Column(
                  children: [
                    boxes('-', 1, Colors.blue),
                    boxes('×', 1, Colors.blue),
                    boxes('÷', 1, Colors.blue),
                    boxes('=', 2, Colors.redAccent),

                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }


}
