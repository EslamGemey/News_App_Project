import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Ex extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        titleSpacing: 40,
        backgroundColor: Colors.blue,
        title: Text(
            'Revision'
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.grey,
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.green,
            ),
          )
        ],
      ),
    );
    
    
  }
} 