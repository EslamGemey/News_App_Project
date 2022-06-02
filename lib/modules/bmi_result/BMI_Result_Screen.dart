import 'package:flutter/material.dart';

class BMIResult extends StatelessWidget {

  final bool IsMale;
  final int age;
  final int result;

  BMIResult({
    @required this.age,
    @required this.result,
    @required this.IsMale,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Result',
        ),
        leading: IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
           icon:Icon(
               Icons.arrow_back_ios_outlined
           )
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Gender: ${IsMale? 'Male' : 'Female'}',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 25
              ),
            ),
            Text(
              'Result: $result',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
            Text(
              'Age: $age',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25
              ),
            ),
          ],
        ),
      ),
    );
  }
}
