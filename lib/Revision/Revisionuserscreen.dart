import 'package:flutter/material.dart';

class ModelData{
  final String id;
  final String name;
  final String phone;
  ModelData({
    @required this.id,
    @required this.name,
    @required this.phone
});
}




class User_Screen extends StatelessWidget{
  List<ModelData> user = [
    ModelData(
        id: '1', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '2', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '3', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '4', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '5', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '6', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '7', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '8', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '9', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '2', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '3', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '4', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '5', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '6', name: 'Ahmed Gamal Mohamed', phone: '0123'),
    ModelData(
        id: '7', name: 'Ahmed Gamal Mohamed', phone: '0123'),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: ListView.separated(
            itemBuilder:(context,index)=> builditem(user[index]),
            separatorBuilder:(context,index)=> Padding(
              padding: EdgeInsetsDirectional.only(
                start: 10,

              ),
              child: Container(
                width: double.infinity,
                height: 1.5,
                color: Colors.red,
              ),
            ),
            itemCount: user.length
        )
      ),
    );
  }
}

Widget builditem(ModelData user)=> Padding(
    padding: EdgeInsets.all(8),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
    children: [
      CircleAvatar(
        radius: 26,
        child: Text('${user.id}',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
      ),
      SizedBox(
        width: 10,
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            '${user.name}',
          style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
          Text('${user.phone}',style: TextStyle(fontSize: 20,color: Colors.black))
        ],
      )
  ],

),
);