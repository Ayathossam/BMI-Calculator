import 'dart:math';

import 'package:bmi_calculator/bmi_result.dart';
import 'package:flutter/material.dart';

class BmiScreen extends StatefulWidget {
  const BmiScreen({super.key});

  @override
  State<BmiScreen> createState() => _BmiScreenState();
}

class _BmiScreenState extends State<BmiScreen> {
  bool isMale = true;
  double height = 100.0;
  double weight = 60.0;
  int age = 16;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(child: Text("BMI Calculator")),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: 100,
              margin: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = true;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isMale ? Colors.red : Colors.black38),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.male, color: Colors.white, size: 50),
                            Text(
                              "MALE",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 30),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isMale = false;
                        });
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isMale ? Colors.black38 : Colors.red),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.female,
                              color: Colors.white,
                              size: 50,
                            ),
                            Text("FEMALE",
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 30))
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 12),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.black38),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT",
                      style: TextStyle(color: Colors.grey, fontSize: 20)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${height.round()}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.w900)),
                      Text("CM",
                          style: TextStyle(color: Colors.grey, fontSize: 10)),
                    ],
                  ),
                  Slider(
                      value: height,
                      activeColor: Colors.red,
                      inactiveColor: Colors.grey,
                      max: 240.0,
                      min: 60.0,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                      }),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 100,
              margin: EdgeInsets.all(12),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black38),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "WEIGHT",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text('${weight.round()}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: IconButton.filled(
                                      onPressed: () {
                                        setState(() {
                                          if (weight > 35) {
                                            weight--;
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ))),
                              SizedBox(
                                width: 12,
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: IconButton.filled(
                                      onPressed: () {
                                        setState(() {
                                          weight++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.black38),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "AGE",
                            style: TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                          Text('${age}',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontWeight: FontWeight.w900)),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: IconButton.filled(
                                      onPressed: () {
                                        setState(() {
                                          if (age > 10) {
                                            age--;
                                          }
                                        });
                                      },
                                      icon: Icon(
                                        Icons.remove,
                                        color: Colors.white,
                                      ))),
                              SizedBox(
                                width: 12,
                              ),
                              CircleAvatar(
                                  backgroundColor: Colors.grey,
                                  child: IconButton.filled(
                                      onPressed: () {
                                        setState(() {
                                          age++;
                                        });
                                      },
                                      icon: Icon(
                                        Icons.add,
                                        color: Colors.white,
                                      ))),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: double.infinity,
            color: Colors.red,
            child: MaterialButton(
              onPressed: () {
                double result = weight / pow(height / 100, 2);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BmiResult(
                        isMale: isMale,
                        age: age,
                        result: result.roundToDouble()),
                  ),
                );
              },
              height: 50.0,
              child: Text('CALCULATE',
                  style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
          ),
        ],
      ),
    );
  }
}
