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
        backgroundColor: Color(0XFF1D1E33),
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
              colour: Color(0XFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40.0,
                      color: Colors.tealAccent,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: bigText,
                  ),
                  Text(
                    'Normal BMI range:18.5 - 25 kg/m2',
                    style: labelText,
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: labelText,
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
              color: Colors.redAccent,
              margin: EdgeInsets.only(top: 10.0),
              padding: EdgeInsets.only(bottom: 20.0),
              width: double.infinity,
              height: 80.0,
            ),
          )
        ],
      ),
    );
  }
}
