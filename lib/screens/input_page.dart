import 'package:bmi_calculator_flutter/components/reUsableCRAD.dart';
import 'package:bmi_calculator_flutter/screens/results.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator_flutter/bmi_brain.dart';
import '../components/bottomBtn.dart';
import '../constants.dart';
import '../components/icon_content.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  late Gender selGender = Gender.male;
  int height = 180;
  int weight = 60;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0XFF1D1E33),
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selGender = Gender.male;
                      });
                    },
                    child: ReusableCard(
                      colour: selGender == Gender.male ? cl : clTap,
                      cardChild: iconText(icon: Icons.male, teName: 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selGender = Gender.female;
                      });
                    },
                    child: ReusableCard(
                      colour: selGender == Gender.female ? cl : clTap,
                      cardChild: iconText(icon: Icons.female, teName: 'Female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: cl,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    "Height",
                    style: labelText,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    mainAxisAlignment: MainAxisAlignment.center,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: bigText,
                      ),
                      const Text(
                        'cm',
                        style: labelText,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Colors.redAccent,
                      activeTrackColor: Colors.white,
                      overlayColor: const Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              child: Row(
            children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: cl,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Weight',
                        style: labelText,
                      ),
                      Text(
                        weight.toString(),
                        style: bigText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconBtn(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            icoon: Icons.exposure_minus_1,
                          ),
                          SizedBox(
                            width: 18,
                          ),
                          RoundIconBtn(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            icoon: Icons.add,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: cl,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age',
                        style: labelText,
                      ),
                      Text(
                        age.toString(),
                        style: bigText,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconBtn(
                              icoon: Icons.exposure_minus_1,
                              onPressed: () {
                                setState(() {
                                  age--;
                                });
                              }),
                          SizedBox(
                            width: 18,
                          ),
                          RoundIconBtn(
                              icoon: Icons.add,
                              onPressed: () {
                                setState(() {
                                  age++;
                                });
                              })
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class RoundIconBtn extends StatelessWidget {
  RoundIconBtn({required this.icoon, required this.onPressed});
  final IconData icoon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      elevation: 0.0,
      child: Icon(icoon),
      onPressed: onPressed,
      constraints: BoxConstraints(
        minWidth: 56.0,
        minHeight: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Colors.blueGrey,
    );
  }
}
