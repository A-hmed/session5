import 'package:flutter/material.dart';

class CalcualtorButton extends StatelessWidget {
  String digit;
  Function onButtonClicked;
  CalcualtorButton(this.digit,this.onButtonClicked);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
          margin: EdgeInsets.all(4),
          child: ElevatedButton(
              onPressed: (){
                if(digit!='='){
                  onButtonClicked(digit);
                }else{
                  onButtonClicked();
                }

              },
              child: Text(digit,style: TextStyle(fontSize: 18),)
          ),
        )
    );
  }
}
