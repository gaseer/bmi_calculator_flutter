import 'package:bmi_calculator_flutter/constants.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/components/reUsableCRAD.dart';
import 'input_page.dart';

class Result extends StatelessWidget {
  Result(
      {required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Results'),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 15.0),
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Your Result',
                style: bigText,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: Colors.grey,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.greenAccent,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: bigText,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    'Normal BMI range:18.5 - 25 kg/m2',
                    style: labelText,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: largeText,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              child: Center(
                  child: Text(
                'RE-CALCULATE',
                style: largeText,
              )),
              margin: EdgeInsets.all(15.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                  color: Colors.green, borderRadius: BorderRadius.circular(20)
                  //more than 50% of width makes circle
                  ),
              width: double.infinity,
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
