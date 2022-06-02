import 'dart:math';

import 'package:abdulahapp/modules/bmi_result/BMI_Result_Screen.dart';
import 'package:abdulahapp/modules/messenger/MessengerScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Bmi extends StatefulWidget{
  @override
  BmiState createState()=> BmiState();
}

class  BmiState extends State<Bmi>{
   bool Is_Male = true;
   double height = 80;

   int weight = 40;
   int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator'
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          Is_Male = true;
                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/32551.png'),
                              height: 90,
                              width:90,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Text(
                                'MALE',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,fontSize: 27.0
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Is_Male? Colors.blue :Colors.grey[400]
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                          Is_Male = false;
                        });
                      },
                      child: Container(

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(
                              image: AssetImage('assets/images/img_23991.png'),
                              height: 90,
                              width:90,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Text(
                              'FEMALE',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,fontSize: 27.0
                              ),
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: !Is_Male? Colors.blue:Colors.grey[400]
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20
              ),
              child: Container(
                 decoration: BoxDecoration(
                   borderRadius: BorderRadius.circular(20),
                   color: Colors.grey[400]
                 ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        'Height',
                      style: TextStyle(
                        fontSize: 30.0,
                        fontWeight: FontWeight.w900
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          '${height.round()}',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.w900
                          ),
                        ),

                        Text(
                            'CM',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize:20
                          ),
                        )
                      ],
                    ),
                    Slider(
                        value: height,
                        max: 230,
                        min: 75,
                        onChanged: (value){
                          setState(() {
                            height = value;
                          });
                        }
                    )
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                                fontSize: 30.0,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Text(
                            '$weight',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.w900
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                mini: true,
                                onPressed: (){
                                  setState(() {
                                    weight--;
                                  });
                                },
                                heroTag: 'w-',
                                child: Icon(
                                  Icons.remove
                                ),
                              ),
                              FloatingActionButton(
                                mini: true,
                                onPressed: (){
                                  setState(() {
                                    weight++;
                                  });
                                },
                                heroTag: 'w+',
                                child: Icon(
                                    Icons.add
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[400]
                        )
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'AGE',
                              style: TextStyle(
                                  fontSize: 30.0,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            Text(
                              '$age',
                              style: TextStyle(
                                  fontSize: 40,
                                  fontWeight: FontWeight.w900
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  heroTag: 'a-',
                                  mini: true,
                                  child: Icon(
                                      Icons.remove
                                  ),
                                ),
                                FloatingActionButton(
                                  onPressed: (){
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  heroTag: 'a+',
                                  mini: true,
                                  child: Icon(
                                      Icons.add
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.grey[400]
                        )
                    ),
                  )
                ],
              ),
            )
          ),
          Container(
            width: double.infinity,
            height: 55,
            color: Colors.blue,
            child: MaterialButton(
                onPressed: (){
                  var result = weight / pow(height/100, 2);
                  print(result.round());

                  Navigator.push(context, MaterialPageRoute(builder: (context)=> BMIResult(
                        age: age,
                        IsMale: Is_Male,
                        result: result.round(),
                      )
                      )
                  );
                },
                child: Text(
                    'CALCULATE',
                  style: TextStyle(
                    color: Colors.white
                  ),
                )
            ),
          )
        ],
      ),
    );
  }

}