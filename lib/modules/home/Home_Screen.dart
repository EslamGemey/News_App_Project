import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        // foregroundColor: Colors.black,
        leading: Icon(Icons.menu),
        title: Text('Gamer'),
        actions: [
          IconButton(
              onPressed: () {
                print('I am great');
              },
              icon: Icon(Icons.notification_important)),
          IconButton(
              icon: Text('Hello'),
            onPressed: (){
                print('Hello');
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadiusDirectional.only(
                    topEnd: Radius.circular(20.0)
                ),

              ),
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Image(
                    image: NetworkImage(
                      'http://3.bp.blogspot.com/_cY1l96f0e6c/TMHNn7BQPdI/AAAAAAAAABA/yZFgXoTH8rU/s1600/13.jpg'
                    ),
                     // height: 200.0,
                     // width: 190.0,
                    fit: BoxFit.cover,
                  ), 
                  Container(
                    width: double.infinity,
                      color: Colors.black.withOpacity(.7),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0
                      ),
                      child: Text(

                    'Baby Shark',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white,
                        fontSize: 30.0),
                  )
                  )
                ],
              ),
            ),
          ),
        ],
      ),

        );

  }
}
