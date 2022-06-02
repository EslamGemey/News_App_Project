import 'package:flutter/material.dart';

class Revision extends StatelessWidget{
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // SizedBox(
              //   height: 17,
              // ),
              // CircleAvatar(
              //   radius: 40.0,
              //   backgroundImage: NetworkImage('https://th.bing.com/th/id/OIP.AFxzi6b1l1DCWcXXPDaBpgHaLR?pid=ImgDet&rs=1'),
              //
              // ),
              // IconButton(
              //     onPressed: (){
              //       print('I Love You');
              //     },
              //     icon: Icon(
              //         Icons.add_box
              //     )
              // ),
              // Text(
              //   'data',style: TextStyle(
              //   fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),
              // Text(
              //   'data',style: TextStyle(
              //     fontSize: 40
              // ),),

            //  listview
              ListView.separated(
                shrinkWrap: true,
                   physics:  NeverScrollableScrollPhysics(),
                  itemBuilder: (context,index)=> Container(

                      color: Colors.blueGrey,
                      child: Text('item',
                      style: TextStyle(fontSize: 50),),
              ),
                  separatorBuilder: (context,index) => SizedBox(
                      height: 15,
                    )
                  ,
                  itemCount: 16
              )




            ],
          ),
        ),
      ),
    );
  }
}