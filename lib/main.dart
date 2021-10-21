import 'package:calcualter/CalcualtorButton.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // second commit
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Calculator(),
    );
  }
}













class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String result='';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calcualtor'),
      ),
       body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(result==''?'0.0':result ,style: TextStyle(
                        fontSize: 26
                      ),),
                    ],
                  )
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcualtorButton('7',onDigitClicked),
                    CalcualtorButton('8',onDigitClicked),
                    CalcualtorButton('9',onDigitClicked),
                    CalcualtorButton('*',onOperatorClicked)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcualtorButton('4',onDigitClicked),
                    CalcualtorButton('5',onDigitClicked),
                    CalcualtorButton('6',onDigitClicked),
                    CalcualtorButton('/',onOperatorClicked)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcualtorButton('1',onDigitClicked),
                    CalcualtorButton('2',onDigitClicked),
                    CalcualtorButton('3',onDigitClicked),
                    CalcualtorButton('+',onOperatorClicked)
                  ],
                ),
              ),
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    CalcualtorButton('.',onDigitClicked),
                    CalcualtorButton('0',onDigitClicked),
                    CalcualtorButton('=',onEqualClicked),
                    CalcualtorButton('-',onOperatorClicked)
                  ],
                ),
              )
            ],
          ),
        )
    );
  }
  String operator='';
  String LHS='';

  void onEqualClicked(){
    String RHS=result;
    result=caluclate(LHS,operator,RHS);
    LHS='';
    operator='';
    setState(() {

    });
  }
  void onOperatorClicked(String operatorClicked){
     if(operator.isEmpty){
       LHS=result;
       result='';
       operator=operatorClicked;
       setState(() {
       });
     }else{
       String RHS=result;
      LHS=caluclate(LHS,operator,RHS);
      operator=operatorClicked;
      result='';
       setState(() {
       });
     }
  }
  String caluclate(String LHS,String operator,String RHS){
    double n1=double.parse(LHS);
    double n2=double.parse(RHS);
    double res=0;
    if(operator=='+'){
      res=n1+n2;
    }else if(operator=='-'){
      res=n1-n2;
    }else if(operator=='*'){
      res=n1*n2;
    }else if(operator=='/'){
      res=n1/n2;
    }
    return res.toString();
  }
  void onDigitClicked(String digit){
   print('clicked');
   print(digit);
   result+=digit;
   setState(() {

   });
  }
}

