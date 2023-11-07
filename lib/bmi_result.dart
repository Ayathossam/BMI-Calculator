import 'package:flutter/material.dart';

class BmiResult extends StatelessWidget {
  double result;
  bool isMale;
  int age;

  BmiResult({required this.result, required this.isMale, required this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("BMI RESULT"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Gender : ${isMale ? "Male" : "Female"}',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 30,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              height: 12,
            ),
            Text('Result : ${result} ',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 30,
                    fontWeight: FontWeight.w900)),
            SizedBox(
              height: 12,
            ),
            Text('Age : ${age} ',
                style: TextStyle(
                    color: Colors.black38,
                    fontSize: 30,
                    fontWeight: FontWeight.w900)),
          ],
        ),
      ),
    );
  }
}
